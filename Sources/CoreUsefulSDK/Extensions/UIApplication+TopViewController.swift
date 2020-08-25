// UIApplication+TopViewController.swift
//
// Copyright (c) 2020 Burak Uzunboy
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if !os(macOS) && !os(watchOS)
import UIKit

public extension UIApplication {
    
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

#endif
