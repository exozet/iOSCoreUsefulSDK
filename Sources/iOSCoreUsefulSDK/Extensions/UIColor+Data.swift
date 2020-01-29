//
//  UIColor+Data.swift
//  
//
//  Created by Burak Uzunboy on 18.01.20.
//

import UIKit

public extension UIColor {
    class func color(withData data:Data) -> UIColor {
         return NSKeyedUnarchiver.unarchiveObject(with: data) as! UIColor
    }

    func encode() -> Data {
         return NSKeyedArchiver.archivedData(withRootObject: self)
    }
}
