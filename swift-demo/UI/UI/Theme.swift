//
//  Theme.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import Foundation
import UIKit

//MARK: UI Light Modes
func tForceLightMode(controller: UIViewController) {
    controller.overrideUserInterfaceStyle = .light
}

func tForceDarkMode(controller: UIViewController) {
    controller.overrideUserInterfaceStyle = .dark
}

// MARK: - Screen Size Constants
let kScreenSize: CGRect = UIScreen.main.bounds
let kScreenWidth = kScreenSize.width
let kScreenHeight = kScreenSize.height

// MARK: - Colors
let kColorFlatGreen: UIColor = UIColor(red: 0.152, green: 0.684, blue: 0.373, alpha: 1.0)
let kColorFlatBlue: UIColor = UIColor(red: 41.0/255.0, green: 128.0/255.0, blue: 185.0/255.0, alpha: 1.0)
let kColorFlatPurple: UIColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255, alpha: 1.0)
let kColorFlatDarkGray: UIColor = UIColor(red: 0.227, green: 0.227, blue: 0.227, alpha: 1.0)
let kColorFlatYellow: UIColor = UIColor(red: 0.917, green: 0.771, blue: 0.273, alpha: 1.0)
let kColorTransparentWhite: UIColor = UIColor.white.withAlphaComponent(0.85)
let kColorWhite: UIColor = UIColor.white

// MARK: - Fonts
let kDefaultFontSize = CGFloat(15.0)

func kThemeFontBold(size: Float) -> UIFont {
    guard let font = UIFont(name:"AvenirNext-Bold", size: CGFloat(size)) else {
        return UIFont(name:"AvenirNext-Bold", size: kDefaultFontSize)!
    }
    return font
}

func kThemeFontBoldItalic(size: Float) -> UIFont {
    guard let font = UIFont(name:"AvenirNext-BoldItalic", size: CGFloat(size)) else {
        return UIFont(name:"AvenirNext-BoldItalic", size: kDefaultFontSize)!
    }
    return font
}

func kThemeFontDemiBold(size: Float) -> UIFont {
    guard let font = UIFont(name:"AvenirNext-DemiBold", size: CGFloat(size)) else {
        return UIFont(name:"AvenirNext-DemiBold", size: kDefaultFontSize)!
    }
    return font
}

func kThemeFontDemiBoldItalic(size: Float) -> UIFont {
    guard let font = UIFont(name:"AvenirNextCondensed-DemiBoldItalic", size: CGFloat(size)) else {
        return UIFont(name:"AvenirNextCondensed-DemiBoldItalic", size: kDefaultFontSize)!
    }
    return font
}

func kThemeFontMedium(size: Float) -> UIFont {
    guard let font = UIFont(name:"AvenirNext-Medium", size: CGFloat(size)) else {
        return UIFont(name:"AvenirNext-Medium", size: kDefaultFontSize)!
    }
    return font
}

func kThemeFontMediumItalic(size: Float) -> UIFont {
    guard let font = UIFont(name:"AvenirNext-MediumItalic", size: CGFloat(size)) else {
        return UIFont(name:"AvenirNext-MediumItalic", size: kDefaultFontSize)!
    }
    return font
}

func setupDefaultConstraints(view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
}

func addDefaultConstraints(parent: UIViewController, view: UIView) {
    NSLayoutConstraint(item: view , attribute: .leading, relatedBy: .equal, toItem: parent.view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: view , attribute: .trailing, relatedBy: .equal, toItem: parent.view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: view , attribute: .top, relatedBy: .equal, toItem: parent.view, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: view , attribute: .bottom, relatedBy: .equal, toItem: parent.view, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
}



