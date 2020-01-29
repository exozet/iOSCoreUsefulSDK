//
//  LoggingDelegate.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 21.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

public protocol LoggingDelegate: class {
    func log(message: String,
             level: LogLevel,
             domain: LogDomain,
             source: String)
}

extension LoggingDelegate {
    func log(message: String,
    level: LogLevel,
    domain: LogDomain,
    source: String) { }
}
