//
//  UIView+Nib.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 14.08.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

extension UIView: ViewExpressable {
}

public protocol ViewExpressable: UIView {
}

public extension ViewExpressable {
    /// Creates views from the Nib files if they have same name with their classes.
    static func create() -> Self {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)![0] as! Self
    }
}

