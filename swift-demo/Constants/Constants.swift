//
//  Constants.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import Foundation

enum MealTypes {
    case Meal
    case MealRecipe
    case MealCategory
}

struct Constants {
    
    //MARK: - Endpoints
    static let kCategoriesEndpoint = "https://www.themealdb.com/api/json/v1/1/categories.php"
    static let kMealsEndpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    static let kRecipeEndpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
}




