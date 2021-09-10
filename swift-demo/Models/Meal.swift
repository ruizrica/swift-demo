//
//  Meal.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import Foundation

class MealResponse: Codable {
    
    var meals: Array<Meal>
}

class Meal: Codable {
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    static func fetch(category: String, handler: @escaping (Result<Array<Meal>?, NetworkErrors>) -> Void) {
        
        let endpoint = Constants.kMealsEndpoint + category
        Network.manager.loadCollection(urlString: endpoint) { (results) in
            switch results {
                case .success(let data):
                    if let response = try? JSONDecoder().decode(MealResponse.self, from: data!) {
                        var sorted = response.meals
                        sorted.sort { $0.strMeal < $1.strMeal }
                        handler(.success(sorted))
                    }
            case .failure(_):
                handler(.failure(NetworkErrors.invalidData))
            }
        }
    }
}
