// String+Attributed.swift
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

import Foundation
import UIKit

public extension String {
    
    /// Converts string to `URL`.
    func convertURL() -> URL? {
        return URL(string: self)
    }
    
    /// Converts string to Integer value.
    var intValue: Int? {
        return Int(self) ?? (self.doubleValue != nil ? Int(self.doubleValue!) : nil)
    }
    
    /// Converts string to Double value.
    var doubleValue: Double? {
        return Double(self)
    }
    
    /// Converts string to `Date` object with the Database Timestamp format.
    var dateValue: Date? {
        return self.date(withFormat: "yyyy-MM-dd'T'hh:mm:ss")
    }
    
    /// Converts string to `Date` object with the given format.
    func date(withFormat format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    /// Returns localized string.
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    /// Returns attributed string
    func attributed(with attributes: [NSAttributedString.Key:Any]) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
    
    /**
     Returns HTML attributed string with custom attributes.
     - parameter attributes: custom attributes
     - returns: HTML formatted `NSAttributedString`
     */
    func richAttributed(with attributes: [NSAttributedString.Key:Any]) -> NSAttributedString {
        var text = NSMutableAttributedString(string: self)
        do {
            text = try NSMutableAttributedString(data: self.data(using: .unicode, allowLossyConversion: true)!,
                                                 options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                                                 documentAttributes: nil)
        } catch {
            print(error.localizedDescription)
        }
        
        for attribute in attributes {
            if attribute.key == .font {
                guard let font = attribute.value as? UIFont else { break }
                let size = font.pointSize
                // check font weight
                text.enumerateAttribute(.font, in: NSRange(location: 0, length: text.string.count), options: .init(rawValue: 0)) { (object, range, stop) in
                    var newFont: UIFont = font
//
//                    if let fontTraits = (object as? UIFont)?.fontDescriptor.symbolicTraits {
//                        if fontTraits.contains(.traitItalic) && fontTraits.contains(.traitBold) {
//                            newFont = UIFont.font(style: .boldItalic, size: size)
//                        }
//                        else if fontTraits.contains(.traitBold) {
//                            newFont = UIFont.font(style: .bold, size: size)
//                        }
//                        else if fontTraits.contains(.traitItalic) {
//                            newFont = UIFont.font(style: .regularItalic, size: size)
//                        } else {
//                            newFont = UIFont.font(style: .regular, size: size)
//                        }
//                    }
                    
                    text.addAttribute(.font, value: newFont, range: range)
                }
            } else if attribute.key == .paragraphStyle {
                text.enumerateAttribute(.paragraphStyle, in: NSRange(location: 0, length: text.string.count), options: .init(rawValue: 0)) { (object, range, stop) in
                    if (object as! NSParagraphStyle).alignment == .natural {
                        // override
                        text.addAttribute(attribute.key, value: attribute.value, range: range)
                    }
                }
            } else {
                // add directly
                text.addAttribute(attribute.key, value: attribute.value, range: NSRange(location: 0, length: text.string.count))
            }
        }
        
        return text
    }
    
    /// Converts string to URL by using `stringLiteral` initializer.
    var url: URL { return URL(stringLiteral: self) }
    
}

