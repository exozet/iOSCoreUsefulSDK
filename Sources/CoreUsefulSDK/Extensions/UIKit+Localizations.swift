// UIKit+Localizations.swift
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
import Foundation
import UIKit


/**
 Make UI Elements Localizable.
 */
public extension UITextField {

    /// Sets localized placeholder text.
    @IBInspectable var localizedPlaceholder: String {
        get { return "" }
        set {
            self.placeholder = newValue.localized
        }
    }
    
    /// Sets localized text.
    @IBInspectable var localizedText: String {
        get { return "" }
        set {
            self.text = newValue.localized
        }
    }
}

public extension UITextView {
    
    /// Sets localized text.
    @IBInspectable var localizedText: String {
        get { return "" }
        set {
            self.text = newValue.localized
        }
    }
}

public extension UIBarItem {
    
    /// Sets localized text.
    @IBInspectable var localizedTitle: String {
        get { return "" }
        set {
            self.title = newValue.localized
        }
    }
}

public extension UILabel {
    
    /// Sets localized text.
    @IBInspectable var localizedText: String {
        get { return "" }
        set {
            self.text = newValue.localized
        }
    }
}

public extension UINavigationItem {
    
    /// Sets localized text.
    @IBInspectable var localizedTitle: String {
        get { return "" }
        set {
            self.title = newValue.localized
        }
    }
}

public extension UIButton {
    
    /// Sets localized text.
    @IBInspectable var localizedTitle: String {
        get { return "" }
        set {
            self.setTitle(newValue.localized, for: .normal)
        }
    }
}

public extension UISearchBar {
    
    /// Sets localized prompt text.
    @IBInspectable var localizedPrompt: String {
        get { return "" }
        set {
            self.prompt = newValue.localized
        }
    }
    
    /// Sets localized placeholder text.
    @IBInspectable var localizedPlaceholder: String {
        get { return "" }
        set {
            self.placeholder = newValue.localized
        }
    }
}

public extension UISegmentedControl {
    
    /// Sets localized text.
    @IBInspectable var localized: Bool {
        get { return true }
        set {
            for index in 0..<numberOfSegments {
                let title = titleForSegment(at: index)!.localized
                setTitle(title, forSegmentAt: index)
            }
        }
    }
}

#endif
