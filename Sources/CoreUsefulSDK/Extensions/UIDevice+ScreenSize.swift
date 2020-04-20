// UIDevice+ScreenSize.swift
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

public extension UIDevice {
    
    /// Typealias from the CGFloat.
    typealias ScreenSize = CGFloat
    
    /// Holds all possible values for screen sizes.
    struct ScreenSizes {
        
        /// `4.0` inch screen size (iPhone 5, 5s, SE)
        public static let small: ScreenSize = 1136
        
        /// `4.7` inch screen size (iPhone 6, 6s, 7, 8)
        public static let standard: ScreenSize = 1334
        
        /// `6.1` inch screen size (iPhone XR)
        public static let XR: ScreenSize = 1792
        
        /// `5.5` inch screen size (iPhone 6+, 7+, 8+)
        public static let plus: ScreenSize = 1920
        
        /// `5.8` inch screen size (iPhone X, XS)
        public static let X: ScreenSize = 2436
        
        /// `6.5` inch screen size (iPhone XS Max)
        public static let max: ScreenSize = 2688
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
        if #available(iOS 11.0, *), #available(tvOS 11.0, *) {
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
#endif
