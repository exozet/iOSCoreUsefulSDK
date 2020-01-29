//
//  Array+getElement.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 24.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

public extension Array {
    
    /**
     Returns element at the index, if index is valid.
     - parameter index: Index of the element
     - returns: Element if the index is valid, otherwise `nil`.
     */
    func get(_ index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
    
    /**
     Appends element to array if its not `nil`.
     - parameter nullableElement: Any type of element
     */
    mutating func insert(_ nullableElement: Element?) {
        if let element = nullableElement {
            self.append(element)
        }
    }
    
    /**
     Appends elements into the current array.
     - parameter nullableArray: Array to be inserted.
     */
    mutating func insert(_ nullableArray: [Element]?) {
        if let array = nullableArray {
            self.append(contentsOf: array)
        }
    }
    
    /// Inserts the element into given array.
    /// - Parameters:
    ///   - first: Array
    ///   - second: Element to insert inside of the array.
    static func + (first: inout Array<Element>, second: Element?) -> Array<Element> {
        first.insert(second)
        return first
    }
    
    /// Inserts the element into given array
    /// - Parameters:
    ///   - left: Array
    ///   - right: Element to insert inside of the array.
    
    static func += (left: inout Array<Element>, right: Element?) {
        left.insert(right)
    }
    
}
