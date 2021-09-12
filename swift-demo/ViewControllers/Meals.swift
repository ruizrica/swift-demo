//
//  Meals.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/11/21.
//

import UIKit

class Meals: UIViewController {
    
    var selected : String = ""
    var collection : Array<Meals>? = []
    //var collectionView : DrawUI_mealCollectionView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        drawUI()
        print("Selected: \(selected)")
    }
    
    func drawUI() {
        
        DispatchQueue.main.async {
            
            kForceDarkMode(controller: self)
            let header = MealsHeader(titleString: self.selected.capitalized, authorString: "-", contactString: "-")
            self.view.addSubview(header)
            
            let collectionView = MealsCollectionView(controller: self, selection: self.selected)
            self.view.addSubview(collectionView)
//            kForceDarkMode(controller: self)
//            guard let selectedCategory = self.selected else { return }
//            let header = DrawUI_mealHeader(title: selectedCategory.capitalized)
//            self.collectionView = DrawUI_mealCollectionView(controller: self, collection: [])
//            self.view.backgroundColor = kColor_flatDarkGray
//            self.view.addSubview(header)
//
//            guard let collectionView = self.collectionView else { return }
//            Theme().setupConstraints(view: collectionView)
//            self.view.addSubview(collectionView)
//            Theme().addConstraints(parent: self, view: collectionView)
        }
    }
}
