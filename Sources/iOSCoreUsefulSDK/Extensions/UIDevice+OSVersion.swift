//
//  UIDevice+OSVersion.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 18.10.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    /// Methods to compare and check OS versions of the device.
    class systemVersion {
        
        /**
         Checks whether the OS version is equal to specified one.
         - parameter version: OS version to check - e.g. "11.2"
         - returns: `true` if they are equal.
         */
        class func equal(to version: String) -> Bool {
            return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedSame
        }
        
        /**
         Checks whether the OS version is greater than the specified one.
         - parameter version: OS version to check - e.g. "11.2"
         - returns: `true` if OS is greater.
         */
        class func greater(than version: String) -> Bool {
            return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedDescending
        }
        
        /**
         Checks whether the OS version is greater than or equal to specified one.
         - parameter version: OS version to check - e.g. "11.2"
         - returns: `true` if OS is greater or equal.
         */
        class func greaterOrEqual(to version: String) -> Bool {
            return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedAscending
        }
        
        /**
         Checks whether the OS version is less than the specified one.
         - parameter version: OS version to check - e.g. "11.2"
         - returns: `true` if OS is less.
         */
        class func less(than version: String) -> Bool {
            return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedAscending
        }
        
        /**
         Checks whether the OS version is less than or equal to specified one.
         - parameter version: OS version to check - e.g. "11.2"
         - returns: `true` if OS is less or equal.
         */
        class func lessOrEqual(to version: String) -> Bool {
            return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedDescending
        }
    }
    
}
