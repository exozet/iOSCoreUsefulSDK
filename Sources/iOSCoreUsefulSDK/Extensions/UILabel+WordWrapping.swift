//
//  UILabel+WordWrapping.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 30.09.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

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
