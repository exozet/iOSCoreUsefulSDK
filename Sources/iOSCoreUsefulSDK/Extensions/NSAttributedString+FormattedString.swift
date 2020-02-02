// NSAttributedString+FormattedString.swift
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
