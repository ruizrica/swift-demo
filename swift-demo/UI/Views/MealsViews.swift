//
//  MealsViews.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/11/21.
//

import UIKit

class MealsViews: UIView {
    
    var collectionView: UIView?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(selection: String, controller: Meals) {
        self.init()
        setup(selection: selection, controller: controller)
    }
    
    private func setup(selection: String, controller: Meals) {
        controller.view.backgroundColor = kColorFlatDarkGray
        let header = MealsHeader(titleString: "iOS/Swift Coding Demo", authorString: "Ricardo Ruiz", contactString: "ricardo@kenetic-labs.com")
        addSubview(header)
        self.collectionView = MealsCollectionView(controller: controller, selection: selection)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("no storyboard...")
    }
}

class MealsHeader: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(titleString: String = "", authorString: String = "", contactString: String = "") {
        self.init()
        setup(titleString: titleString, authorString: authorString, contactString: contactString)
    }
    
    private func setup(titleString: String = "", authorString: String = "", contactString: String = "") {
        
        let header = UIView(frame: CGRect(x:0, y:0, width:kScreenWidth, height:120))
        header.backgroundColor = kColorFlatGreen
        
        let titleOffset = 30
        let labelHeight = 40
        let title = UILabel(frame: CGRect(x: titleOffset, y: titleOffset+5, width: Int(kScreenWidth)-titleOffset, height: labelHeight))
        title.font = kThemeFontMediumItalic(size: 24)
        title.textColor = kColorWhite
        title.text = titleString //"iOS/Swift Coding Demo"
        header.addSubview(title)
        
        let author = UILabel(frame: CGRect(x: titleOffset, y: titleOffset+30, width: Int(kScreenWidth)-titleOffset, height: labelHeight))
        author.font = kThemeFontMedium(size: 14)
        author.textColor = kColorTransparentWhite
        author.text = authorString //"Ricardo Ruiz"
        header.addSubview(author)
        
        let contact = UILabel(frame: CGRect(x: titleOffset, y: titleOffset+50, width: Int(kScreenWidth)-titleOffset, height: labelHeight))
        contact.font = kThemeFontMediumItalic(size: 14)
        contact.textColor = kColorTransparentWhite
        contact.text = contactString //"ricardo@kenetic-labs.com"
        header.addSubview(contact)

        self.addSubview(header)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("no storyboard...")
    }
    
}

class MealsCollectionView : UIView, UICollectionViewDelegate, UICollectionViewDataSource {
            
    var controller: Meals?
    var collectionView : UICollectionView?
    var collection: Array<Meal> = []

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(controller: Meals, selection: String) {
        self.init()
        Meal.fetch(category: selection) { (result) in
            switch result {
                case .success(let mealObjects):
                    DispatchQueue.main.async {
                        guard let meals = mealObjects else { return }
                        self.setup(controller: controller, collection: meals)
                    }
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
    }
    
    private func setup(controller: Meals, collection: Array<Meal>) {
        
        self.controller = controller
        self.collection = collection
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: CGFloat(kScreenWidth),height: 137)
        
        let offset = 75.0
        let collectionViewFrame = CGRect(x: -16, y: offset, width: Double(kScreenWidth), height: Double(kScreenHeight)-(offset))
        self.collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(UINib(nibName: "MealCategoryCell", bundle:Bundle.main), forCellWithReuseIdentifier: "cell")
        self.collectionView?.backgroundColor = kColorFlatDarkGray
        if let collectionView = self.collectionView {
            self.addSubview(collectionView)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        var count = 0
        if self.collection.count == 0 {
            let noDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat(kScreenWidth), height: CGFloat(kScreenHeight)))
            noDataLabel.text = "Loading..."
            noDataLabel.textColor = kColorFlatYellow.withAlphaComponent(0.70)
            noDataLabel.font = kThemeFontBoldItalic(size: 20)
            noDataLabel.textAlignment = .center
            self.collectionView?.backgroundView = noDataLabel
        } else {
            count = 1
            self.collectionView?.backgroundView = nil
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = self.collection[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MealCell
        cell.label.text = data.strMeal.capitalized
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kScreenWidth, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        DispatchQueue.main.async {
//            let selectedCategory: String = self.collection[indexPath.row].strMeal
//            self.controller?.openMeals(selected: selectedCategory)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("no storyboard...")
    }
}


