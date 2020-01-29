//
//  UIApplication+TopViewController.swift
//  
//
//  Created by Burak Uzunboy on 26.01.20.
//

import UIKit

extension UIApplication {
    
    /// Returns very top view controller.
    class func topViewController() -> UIViewController? {
        if let root = UIApplication.shared.keyWindow?.rootViewController, let topVC = UIApplication.topViewController(in: root) {
            return topVC
        } else {
            return nil
        }
    }
    
    /// Returns top viewcontroller in the root view controller.
    class func topViewController(in rootViewController: UIViewController?) -> UIViewController? {
        guard let rootViewController = rootViewController else {
            return nil
        }
        
        if let tabBarController = rootViewController as? UITabBarController {
            return topViewController(in: tabBarController.selectedViewController)
        } else if let navigationController = rootViewController as? UINavigationController {
            return topViewController(in: navigationController.visibleViewController)
        } else if let presentedViewController = rootViewController.presentedViewController {
            return topViewController(in: presentedViewController)
        }
        return rootViewController
    }
    
}


