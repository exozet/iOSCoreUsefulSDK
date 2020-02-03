// UIFont+StyleKit.swift
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
#endif
