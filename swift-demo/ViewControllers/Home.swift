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
        drawUI()
    }
    
    func drawUI() {
        DispatchQueue.main.async {
            let ui = HomeViews(controller: self)
            self.view .addSubview(ui)
            
            guard let collectionView = ui.collectionView else { return }
            setupDefaultConstraints(view: collectionView)
            self.view.addSubview(collectionView)
            addDefaultConstraints(parent: self, view: collectionView)
        }
    }
    
    func openMeals(selected: String) {
        print(#function)
        weak var weakSelf = self
        DispatchQueue.main.async {
            let meals = Meals()
            meals.selected = selected
            meals.modalPresentationStyle = UIModalPresentationStyle.formSheet
            weakSelf!.present(meals, animated: true, completion: {})
        }
    }
}
