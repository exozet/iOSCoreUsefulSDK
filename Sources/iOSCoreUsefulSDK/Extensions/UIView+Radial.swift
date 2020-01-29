//
//  UIView+Radial.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 23.05.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Rounds corners with the given size.
     - parameter corners: Corners to be rounded
     - parameter radius: Size of the corner
     */
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    /**
     Transforms the view with the given translations and then hides.
     - parameter translationX: translation value for X axis
     - parameter translationY: translation value for Y axis
     - parameter duration: Duration of the animation
     - parameter completion: Called when translation is finished
     */
    func transformAndHide(translationX: CGFloat, translationY: CGFloat, duration: Double, completion: (()->())? = nil) {
        UIView.animate(withDuration: duration, animations: { [weak self] in
            guard let self = self else { return }
            self.transform = CGAffineTransform(translationX: translationX, y: translationY)
        }, completion: { [weak self](completed) in
            self?.isHidden = true
            completion?()
        })
    }

    /**
     Changes the `isHidden` parameter to false and animates the transform.
     - parameter duration: Duration of the animation
     */
    func showAndTransform(duration: Double) {
        self.isHidden = false
        UIView.animate(withDuration: duration, animations: { [weak self] in
            guard let self = self else { return }
            self.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { (completed) in
        })
    }
    
    /// Radiates corner.
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
            if newValue > 0 { self.clipsToBounds = true }
        }
    }
}
