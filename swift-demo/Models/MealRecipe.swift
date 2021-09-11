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

struct Ingredient {
    let ingredient: String
    let measure: String
}

class MealRecipe: Codable {
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String
    let strIngredients: String
    let strArea: String
    let strCategory: String
    var strSource: String?
    var strYoutube: String?
    var strDrinkAlternate: String?
    
    enum CodingKeys : CodingKey {
        case idMeal, strMeal, strMealThumb, strSource, strYoutube, strArea, strCategory, strDrinkAlternate, strInstructions, strIngredients
    }
    
    required init(from decoder: Decoder) throws {
        
        let containerIngredients = try decoder.singleValueContainer()
        let dict = try containerIngredients.decode([String: String?].self)
        var index = 1
        var ingredientsString = ""
        while let ingredient = dict["strIngredient\(index)"] as? String,
              let measure = dict["strMeasure\(index)"] as? String,
              !measure.isEmpty
        {
            ingredientsString.append("- \(measure) \(ingredient)\n")
            index += 1
        }
                        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
        self.strIngredients = ingredientsString
        self.strArea = try container.decode(String.self, forKey: .strArea)
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        
        // Optionals - decodeIfPresent
        self.strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        self.strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        self.strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
    }
    
    static func fetch(mealId: String, handler: @escaping (Result<MealRecipe, NetworkErrors>) -> Void) {
        
        let endpoint = kRecipeEndpoint + mealId
        Network.manager.loadCollection(urlString: endpoint) { (results) in
            switch results {
                case .success(let data):
            
                    if let response = try? JSONDecoder().decode(MealRecipeResponse.self, from: data!) {
                        guard let recipe = response.meals.first else { return }
                        handler(.success(recipe))
                    }
            case .failure(_):
                handler(.failure(NetworkErrors.invalidData))
            }
        }
    }
}
