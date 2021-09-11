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
        
        let ui = HomeUI(controller: self)
        self.view .addSubview(ui)
        
        let collectionView = ui.collectionView
        if let categories = collectionView {
            setupDefaultConstraints(view: categories)
            self.view.addSubview(collectionView!)
            addDefaultConstraints(parent: self, view: categories)
        }
        //Theme().setupConstraints(view: collectionView)

    }

    
    func openMeals(selected: String) {
        print(#function)
    }
}
