//
//  MealCategory.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import Foundation
import UIKit

class MealCategoryResponse: Codable {
    
    var categories: Array<MealCategory>
}

class MealCategory: Codable {
    
    var idCategory: String
    var strCategory: String
    var strCategoryDescription: String
    var strCategoryThumb: String
    
    static func fetch(handler: @escaping (Result<Array<MealCategory>?, NetworkErrors>) -> Void) {
        
        Network.manager.loadCollection(urlString: kCategoriesEndpoint) { (results) in
            switch results {
                case .success(let data):
                    if let response = try? JSONDecoder().decode(MealCategoryResponse.self, from: data!) {
                        var sorted = response.categories
                        sorted.sort { $0.strCategory < $1.strCategory }
                        handler(.success(sorted))
                    }
                case .failure(_):
                    handler(.failure(NetworkErrors.invalidData))
            }
        }
    }
}
