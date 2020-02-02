// Array+getElement.swift
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
