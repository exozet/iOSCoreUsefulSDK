//
//  UIStatusBarStyle+DarkMode.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 25.10.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension UIStatusBarStyle {
    
    /// If OS supports Dark Mode, returns `darkContent`, otherwise `default`.
    static var dark: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
}
