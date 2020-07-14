// UIView+Radial.swift
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
    @IBInspectable open var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
            if newValue > 0 { self.clipsToBounds = true }
        }
    }
}

#endif
