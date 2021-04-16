//
//  NSManagedObjectContext+Utils.swift
//  DigitalAssortmentPlanner
//
//  Created by Philipp Homann on 27.10.20.
//  Copyright © 2020 On Running. All rights reserved.
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

import CoreData

public extension NSManagedObjectContext {
    @discardableResult func saveIfNeeded(shouldReset : Bool = false) throws -> Bool {
        if self.hasChanges {
            try self.save()
            if shouldReset == true {
                self.reset() // Reset the context to clean up the cache and low the memory footprint.
            }
            return true
        } else {
            return false
        }
    }
}


/// allows you to use performAndWait with a throwing function in closure
/// usage:  try context.performAndWait { }
public extension NSManagedObjectContext {
    func performAndWait<T>(_ block: () throws -> T) throws -> T {
        var result: Result<T, Error>?
        performAndWait {
            result = Result { try block() }
        }
        return try result!.get()
    }

    func performAndWait<T>(_ block: () -> T) -> T {
        var result: T?
        performAndWait {
            result = block()
        }
        return result!
    }
}
