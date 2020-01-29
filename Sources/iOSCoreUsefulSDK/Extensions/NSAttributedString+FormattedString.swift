//
//  NSAttributedString+FormattedString.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 05.08.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /// Creates Attributed String with the given strings with format.
    convenience init(format: NSAttributedString, args: NSAttributedString...) {
        let mutableNSAttributedString = NSMutableAttributedString(attributedString: format)
        
        var nsRange = NSString(string: mutableNSAttributedString.string).range(of: "%@")
        var param = 0
        while nsRange.location != NSNotFound {
            guard args.count > 0, param < args.count else {
                fatalError("Not enough arguments provided for \(format)")
            }
            
            mutableNSAttributedString.replaceCharacters(in: nsRange, with: args[param])
            param += 1
            nsRange = NSString(string: mutableNSAttributedString.string).range(of: "%@")
        }
        
        self.init(attributedString: mutableNSAttributedString)
    }
}
