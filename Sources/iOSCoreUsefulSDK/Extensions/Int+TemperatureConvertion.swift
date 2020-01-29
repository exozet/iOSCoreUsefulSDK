//
//  Int+TemperatureConvertion.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 11.07.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

public extension Int {
    
    /// Converts the integer format Celcius into the Fahrenheit.
    func toFahrenheit() -> Int {
        return (self * 9/5) + 32
    }
    
}
