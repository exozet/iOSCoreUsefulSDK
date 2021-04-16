// UIColor+StyleColors.swift
//
// Copyright (c) 2020 Burak Uzunboy
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if !os(macOS)
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
    
    
    
    /**
     Initializes UIColor object from the `HEX` integer.
     - parameter hex: Int in hex format like UIColor(hex: 0xE32D2D)
     - parameter alpha: CGFloat for the alpha value, default is 1.0.
     */
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xFF)
        let green = CGFloat ((hex >> 8) & 0xFF)
        let blue = CGFloat(hex & 0xFF)
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    #if !os(watchOS)
    
    /// Label color that is trait aware for iOS 13, otherwise black.
    class var styleLabel: UIColor {
        if #available(iOS 13.0, *), #available(tvOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
    
    /// Link color that is trait aware for iOS 13, otherwise system blue.
    class var styleLink: UIColor {
        if #available(iOS 13.0, *), #available(tvOS 13.0, *) {
            return .link
        } else {
            return .systemBlue
        }
    }
    
    /// Background color that is trait aware for iOS 13, otherwise white.
    @available(tvOS, unavailable)
    class var styleBackground: UIColor {
        if #available(iOS 13.0, *), #available(tvOS 13.0, *) {
            return .systemBackground
        } else {
            return .white
        }
    }
    
    #endif
    
}

#endif
