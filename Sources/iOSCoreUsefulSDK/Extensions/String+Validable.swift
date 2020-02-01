//
//  String+Validable.swift
//  
//
//  Created by Burak Uzunboy on 01.02.20.
//

import Foundation

/// Prefix operator for password.
infix operator ->*

/// Prefix operator for email.
infix operator ->%

public extension String {
    
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
