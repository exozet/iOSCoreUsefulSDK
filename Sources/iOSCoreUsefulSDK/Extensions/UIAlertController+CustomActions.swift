//
//  UIAlertController+CustomActions.swift
//  
//
//  Created by Burak Uzunboy on 22.12.19.
//

import UIKit

public extension UIAlertController {
    
    /// Adds cancel action to alert controller
    /// - Parameter title: Title for the cancel action.
    func addCancelAction(title: String) {
        let cancelAct = UIAlertAction(cancelAction: title)
        self.addAction(cancelAct)
    }
    
}
