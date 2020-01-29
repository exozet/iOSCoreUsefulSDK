//
//  UIFont+StyleKit.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 17.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension UIFont {

    /// Structure to keep all style of the custom fonts.
    struct CustomFont {
        /// name for the regular style
        var regular: String
        /// name for the regular italic style
        var regularItalic: String
        /// name for the medium style
        var medium: String
        /// name for the medium italic style
        var mediumItalic: String
        /// name for the light style
        var light: String
        /// name for the light italic style
        var lightItalic: String
        /// name for the bold style
        var bold: String
        /// name for the bold italic style
        var boldItalic: String
    }
    
    /// Enum to define available styles of the font.
    enum FontStyle {
        /// regular font
        case regular
        /// regular italic font
        case regularItalic
        /// medium font
        case medium
        /// medium italic font
        case mediumItalic
        /// light font
        case light
        /// light italic font
        case lightItalic
        /// bold font
        case bold
        /// bold italic font
        case boldItalic
    }
    
    /**
     Returns font with the given name and the size
     - parameter name: Name of the font
     - parameter size: Size for the font
     - returns: `UIFont` object.
     */
    private static func font(name: String, size: CGFloat) -> UIFont {
        //        for family: String in UIFont.familyNames
        //        {
        //            print(family)
        //            for names: String in UIFont.fontNames(forFamilyName: family)
        //            {
        //                print("== \(names)")
        //            }
        //        }
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
