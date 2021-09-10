//
//  Theme.swift
//  swift-demo
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import Foundation
import UIKit

struct Theme {
    
    //MARK: UI Light Modes
    func tForceLightMode(controller: UIViewController) {
        controller.overrideUserInterfaceStyle = .light
    }

    func tForceDarkMode(controller: UIViewController) {
        controller.overrideUserInterfaceStyle = .dark
    }

    // MARK: - Screen Size Constants
    static let tScreenSize: CGRect = UIScreen.main.bounds
    static let tScreenWidth = tScreenSize.width
    static let tScreenHeight = tScreenSize.height

    // MARK: - Colors
    static let tColor_flatGreen: UIColor = UIColor(red: 0.152, green: 0.684, blue: 0.373, alpha: 1.0)
    static let tColor_flatBlue: UIColor = UIColor(red: 41.0/255.0, green: 128.0/255.0, blue: 185.0/255.0, alpha: 1.0)
    static let tColor_flatPurple: UIColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255, alpha: 1.0)
    static let tColor_flatDarkGray: UIColor = UIColor(red: 0.227, green: 0.227, blue: 0.227, alpha: 1.0)
    static let tColor_flatYellow: UIColor = UIColor(red: 0.917, green: 0.771, blue: 0.273, alpha: 1.0)
    static let tColor_transparentWhite: UIColor = UIColor.white.withAlphaComponent(0.85)
    static let tColor_white: UIColor = UIColor.white

    // MARK: - Fonts Dynamic
    static let defaultFontSize = CGFloat(15.0)

    static func tFont_Bold_wSize(size: Float) -> UIFont {
        guard let font = UIFont(name:"AvenirNext-Bold", size: CGFloat(size)) else {
            return UIFont(name:"AvenirNext-Bold", size: defaultFontSize)!
        }
        return font
    }

    static func tFont_BoldItalic_wSize(size: Float) -> UIFont {
        guard let font = UIFont(name:"AvenirNext-BoldItalic", size: CGFloat(size)) else {
            return UIFont(name:"AvenirNext-BoldItalic", size: defaultFontSize)!
        }
        return font
    }

    static func tFont_DemiBold_wSize(size: Float) -> UIFont {
        guard let font = UIFont(name:"AvenirNext-DemiBold", size: CGFloat(size)) else {
            return UIFont(name:"AvenirNext-DemiBold", size: defaultFontSize)!
        }
        return font
    }

    static func tFont_DemiBoldItalic_wSize(size: Float) -> UIFont {
        guard let font = UIFont(name:"AvenirNextCondensed-DemiBoldItalic", size: CGFloat(size)) else {
            return UIFont(name:"AvenirNextCondensed-DemiBoldItalic", size: defaultFontSize)!
        }
        return font
    }

    static func tFont_Medium_wSize(size: Float) -> UIFont {
        guard let font = UIFont(name:"AvenirNext-Medium", size: CGFloat(size)) else {
            return UIFont(name:"AvenirNext-Medium", size: defaultFontSize)!
        }
        return font
    }

    static func tFont_MediumItalic_wSize(size: Float) -> UIFont {
        guard let font = UIFont(name:"AvenirNext-MediumItalic", size: CGFloat(size)) else {
            return UIFont(name:"AvenirNext-MediumItalic", size: defaultFontSize)!
        }
        return font
    }
}


