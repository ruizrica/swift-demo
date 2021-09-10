//
//  Home.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import UIKit

class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        MealRecipe.fetch(mealId: "52772") {  (results) in
            switch results {
                case .success(let recipe):
                    print("recipe: \(recipe.strArea)")

                    
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
    }
}
