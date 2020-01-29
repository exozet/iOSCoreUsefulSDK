//
//  UIAlertAction+CustomActions.swift
//  
//
//  Created by Burak Uzunboy on 22.12.19.
//

import UIKit

public extension UIAlertAction {
    
    /// Creates cancel action for alerts without handler.
    /// - Parameter title: Title for the action.
    convenience init(cancelAction title: String) {
        self.init(title: title, style: .cancel)
    }
    
    
}
