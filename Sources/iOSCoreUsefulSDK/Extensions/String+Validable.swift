// String+Validable.swift
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

/// Prefix operator for password.
infix operator ->*

/// Prefix operator for email.
infix operator ->%

public extension String {
    
    /// Typealias for the Regular Expression strings.
    typealias RegEx = String
    
    /// Regular Expression string for email validations.
    static let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    /// Regular Expression string for generic password validations.
    static let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{8,}$"
    
    /// Tries to initialize given string with given regular expression, returns `nil` if it's not validated.
    /// - Parameters:
    ///   - string: String to check validation.
    ///   - regEx: Regular expression string for validation.
    init?(string: String, regEx: RegEx) {
        if !NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: string) {
            return nil
        }
        self = string
    }
    
    /// Tries to initialize given string as email, if it's not valid returns `nil`.
    /// - Parameter email: Email address to check whether is valid.
    init?(email: String) {
        guard let validated = String(string: email, regEx: String.emailRegEx) else { return nil }
        self = validated
    }
    
    /// Tries to initialize given string as password, if it's not valid returns `nil`.
    /// - Parameter password: Password string to check whether is valid.
    init?(password: String) {
        guard let validated = String(string: password, regEx: String.passwordRegEx) else { return nil }
        self = validated
    }
    
    /// Infix operator style initializer for email.
    /// - Parameters:
    ///   - lhs: Variable to assign.
    ///   - rhs: String to check whether is email.
    static func ->% (lhs: inout String?, rhs: String) {
        lhs = String(email: rhs)
    }
    
    /// Infix operator style initializer for password.
    /// - Parameters:
    ///   - lhs: Variable to assign.
    ///   - rhs: String to check whether is password.
    static func ->* (lhs: inout String?, rhs: String) {
        lhs = String(password: rhs)
    }
    
}
