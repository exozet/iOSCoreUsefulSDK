//
//  NSDictionary+getter.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 14.08.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    /**
     Returns element of the dictionary with given index.
     - parameter index: Index for the element
     - returns: Returns element if index is valid
     */
    func get(_ index: Int) -> Value? {
        guard let keyName = Array(self.keys).get(index) else { return nil }
        return self[keyName]
    }
    
}

public extension Dictionary where Key == String {
    
    /// inserts value to dictionary if it is not nil.
    mutating func insert(key: String, value: Value?) {
        if let value = value {
            self[key] = value
        }
    }
}
