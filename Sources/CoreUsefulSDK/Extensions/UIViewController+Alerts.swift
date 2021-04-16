//
//  UIViewController+Utils.swift
//  DigitalAssortmentPlanner
//
//  Created by Gerald Collaku on 28.03.20.
//  Copyright © 2020 Endava. All rights reserved.
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

public extension UIViewController {
    
    
    var isModal: Bool {

          let presentingIsModal = presentingViewController != nil
          let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
          let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController

          return presentingIsModal || presentingIsNavigation || presentingIsTabBar
      }
     
  
    
    var isPresented: Bool {
        return navigationController?.presentingViewController != nil
    }
    
    
    // MARK: alerts
    
    func showAlert(_ title: String?, _ message: String?, actions: [UIAlertAction]) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
			controller.addAction(action)
		}
        
        self.present(controller, animated: true, completion: nil)
    }
    
    
    func showAlert(_ title: String?, _ message: String?, cancelTitle: String? = nil , submitTitle: String? = nil, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let cancel = cancelTitle {
            let cancelAction = UIAlertAction(title: cancel, style: .default, handler: nil)
            alert.addAction(cancelAction)
        }
        if let submit = submitTitle {
            let submitAction = UIAlertAction(title: submit, style: .destructive, handler: handler)
            alert.addAction(submitAction)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(_ title: String?, _ message: String?, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showDissmisableAlert(_ title: String?) {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.view.superview?.backgroundColor = .clear
        
        self.present(alert, animated: true, completion:  {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                alert.dismiss(animated: false, completion: nil)
            }
        })
    }
    
    
    // MARK: keyboard
    
    func hideKeyboard() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
            view.endEditing(true)
    }
    
 }

#endif
