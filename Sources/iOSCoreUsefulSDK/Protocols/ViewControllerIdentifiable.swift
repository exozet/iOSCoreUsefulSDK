// ViewControllerIdentifiable.swift
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
