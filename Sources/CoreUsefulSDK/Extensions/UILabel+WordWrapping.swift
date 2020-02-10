// UILabel+WordWrapping.swift
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

#if !os(macOS) && !os(watchOS)
import UIKit

public extension UILabel {
    
    /// Sets the text to label and checks lengths to avoid word wrapping.
    @discardableResult func fitToText(_ text: String?) -> UIFont {
        self.text = text
        return self.fitToAvoidWordWrapping()
    }
    
    /// Adjusts the font size to avoid long word to be wrapped.
    @discardableResult func fitToAvoidWordWrapping() -> UIFont {
        self.adjustsFontSizeToFitWidth = true
        guard let words = text?.components(separatedBy: " ") else {
            return font // Get array of words separate by spaces
        }
        
        // Find largest word
        var largestWord: NSString = ""
        var largestWordWidth: CGFloat = 0
        
        // Iterate over the words to find the largest one
        for word in words {
            // Get the width of the word given the actual font of the label
            let wordWidth = word.size(withAttributes: [.font: font!]).width
            
            // check if this word is the largest one
            if wordWidth > largestWordWidth {
                largestWordWidth = wordWidth
                largestWord = word as NSString
            }
        }
        
        // reduce the label's font size until the largest word fits
        while largestWordWidth > bounds.width && font.pointSize > 1 {
            // Reduce font and update largest word's width
            font = font.withSize(font.pointSize - 1)
            largestWordWidth = largestWord.size(withAttributes: [.font: font!]).width
        }
        
        return font
    }
    
}

#endif
