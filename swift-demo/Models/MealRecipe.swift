//
//  MealRecipe.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import Foundation

class MealRecipeResponse: Codable {
    let meals: Array<MealRecipe>
}

class MealRecipe: Codable {
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strSource: String?
    let strYoutube: String?
    let strArea: String?
    let strCategory: String?
    let strDrinkAlternate: String?
    let strInstructions: String?
    var strIngredients: String?
    
//    enum CodingKeys : String, CodingKey {
//        case
//    }
    
    static func fetch(mealId: String, handler: @escaping (Result<MealRecipe, NetworkErrors>) -> Void) {
        
        let endpoint = Constants.kRecipeEndpoint + mealId
        Network.manager.loadCollection(urlString: endpoint) { (results) in
            switch results {
                case .success(let data):
            
                    if let response = try? JSONDecoder().decode(MealRecipeResponse.self, from: data!) {
                        let ingredients = self.parseIngredients(data: data)
                        handler(.success(response.meals[0]))
                    }
            case .failure(_):
                handler(.failure(NetworkErrors.invalidData))
            }
        }
    }
    
    static private func parseIngredients(data: Data?) {
        
        let keyForIngredient = "strIngredient"
        let keyForMeasurement = "strIngredient"

        guard let rawArray = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else { return }
//        guard let mealsObjects = (rawArray["meals"] as Array<Any>) else { return }
//        guard let recipe = (rawArray.meals[0] as? Dictionary<String, Any>) else { return }
        
        print(rawArray)
        
//        var ingredients = (rawArray[0] as! Array<[String:String]>).map { (key, value) in
//            if (keyForIngredient.lowercased().range(of: key) != nil) {
//                print(key)
//            }
//        }
    }
}
