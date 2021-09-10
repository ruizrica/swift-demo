//
//  Network.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import Foundation
import UIKit

enum NetworkErrors: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}

class Network {
    
    static let manager = Network()
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}

    func loadCollection(urlString: String, handler: @escaping (Result<Data?, NetworkErrors>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let objData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
                if ((objData as? [String:Any]) != nil) {
                    handler(.success(data))
                } else {
                    handler(.failure(NetworkErrors.invalidData))
                }
            }
        }
        task.resume()
    }
    
    func loadImage(from urlString: String, handler: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            handler(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            handler(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self,
                error == nil,
                let response  = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    handler(nil)
                    return
            }
            self.cache.setObject(image, forKey: cacheKey)
            handler(image)
        }
        task.resume()
    }
}
