//
//  UIColor+StyleColors.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 23.05.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

/**
 Control style of the color before returning
 */
public extension UIColor {
    
    /**
     Initializes UIColor object from the `HEX` string.
     - parameter hexString: String with the `HEX` format
     */
    convenience init(hex hexString: String) {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(white: 0.5, alpha: 1.0)
        } else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: CGFloat(1.0))
        }
    }
    
    /// Label color that is trait aware for iOS 13, otherwise black.
    public class var styleLabel: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
    
    /// Link color that is trait aware for iOS 13, otherwise system blue.
    public class var styleLink: UIColor {
        if #available(iOS 13.0, *) {
            return .link
        } else {
            return .systemBlue
        }
    }
    
    /// Background color that is trait aware for iOS 13, otherwise white.
    public class var styleBackground: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        } else {
            return .white
        }
    }
}
