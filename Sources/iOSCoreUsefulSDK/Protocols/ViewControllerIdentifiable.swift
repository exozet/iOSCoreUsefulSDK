//
//  ViewControllerIdentifiable.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 09.07.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

/**
 ViewControllers who conform this protocol can be identified by their class names and initialize.
 */
public protocol ViewControllerIdentifiable {
    /// The method should return ViewController Identifier in the storyboard.
    static func identifier() -> String
    /// The method should return Storyboard name of the ViewController.
    static func storyboardName() -> String
}

public extension ViewControllerIdentifiable {
    
    /**
     Returns class name as identifier as default.
     - returns: Identifier which should be set in **Storyboard**.
     */
    static func identifier() -> String {
        return String(describing: self)
    }
    
    /**
     Returns storyboardname for initializer
     - returns: Default value is Main. Override for other storyboards.
     */
    static func storyboardName() -> String {
        return "Main"
    }
    
    /**
     Initializes view controller.
     - parameter storyboard: Storyboard of the viewcontroller. If `nil`, uses `storyboardName:` method.
     - parameter vcIdentifier: Storyboard Identifier of the viewcontroller. If `nil`, uses `identifier:` method.
     - parameter bundle: Bundle for the storyboard. Default is `nil`.
     - returns: View Controller
     */
    static func create(storyboard: String? = nil, vcIdentifier: String? = nil, bundle: Bundle? = nil) -> Self {
        let vc = UIStoryboard(name: storyboard ?? storyboardName(), bundle: bundle).instantiateViewController(withIdentifier: vcIdentifier ?? identifier())
        return vc as! Self
    }
    
}

extension UIViewController: ViewControllerIdentifiable { }
