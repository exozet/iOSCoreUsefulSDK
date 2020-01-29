//
//  UIDevice+ScreenSize.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 24.07.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    /// Typealias from the CGFloat.
    typealias ScreenSize = CGFloat
    
    /// Holds all possible values for screen sizes.
    struct ScreenSizes {
        
        /// `4.0` inch screen size (iPhone 5, 5s, SE)
        static let small: ScreenSize = 1136
        
        /// `4.7` inch screen size (iPhone 6, 6s, 7, 8)
        static let standard: ScreenSize = 1334
        
        /// `6.1` inch screen size (iPhone XR)
        static let XR: ScreenSize = 1792
        
        /// `5.5` inch screen size (iPhone 6+, 7+, 8+)
        static let plus: ScreenSize = 1920
        
        /// `5.8` inch screen size (iPhone X, XS)
        static let X: ScreenSize = 2436
        
        /// `6.5` inch screen size (iPhone XS Max)
        static let max: ScreenSize = 2688
    }
    
    /// Enum which can describe screen size and notch property.
    enum ScreenType {
        /// Screens with notch.
        case notch(size: ScreenSize)
        /// Screens without notch.
        case normal(size: ScreenSize)
    }
    
    /// Returns `true` if device has one of with the notch.
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let bottomInset = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            return bottomInset > 0
        } else {
            return false
        }
    }
    
    /// Returns current screen size of the device.
    var screenSize: ScreenSize {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return ScreenSizes.small
        case 1334:
            return ScreenSizes.standard
        case 1792:
            return ScreenSizes.XR
        case 1920, 2208:
            return ScreenSizes.plus
        case 2436:
            return ScreenSizes.X
        case 2688:
            return ScreenSizes.max
        default:
            // assume unknown devices will continue to use X size.
            return ScreenSizes.X
        }
    }
    
    /// Returns type of the device screen.
    var screenType: ScreenType {
        let size = UIDevice.current.screenSize
        switch size {
        case ScreenSizes.small, ScreenSizes.standard, ScreenSizes.plus:
            return ScreenType.normal(size: size)
        case ScreenSizes.X, ScreenSizes.XR, ScreenSizes.max:
            return ScreenType.notch(size: size)
        default:
            return ScreenType.normal(size: size)
        }
    }
    
}
