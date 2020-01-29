//
//  NSError+LocalizedDescription.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 26.07.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

public extension NSError {
    
    /// Initializes NSError object with the given localized description, domain and code.
    convenience init(domain: String, code: Int, description: String?) {
        self.init(domain: domain, code: code, userInfo: (description != nil) ? [NSLocalizedDescriptionKey: description!] : nil)
    }
    
}
