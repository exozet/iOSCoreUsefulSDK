//
//  NSObject+ClassName.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 05.08.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

/**
 Classes that conform this protocol can be described with their class name.
 */
public protocol NameDescribeable {
    /// returns name of the class dynamically.
    var typeName: String { get }
    /// returns name of the class statically.
    static var typeName: String { get }
}

public extension NameDescribeable {
    /// returns name of the class dynamically.
    var typeName: String {
        return String(describing: type(of: self))
    }
    /// returns name of the class statically.
    static var typeName: String {
        return String(describing: self)
    }
}

// Extend NSObject with the protocol.
extension NSObject: NameDescribeable { }

