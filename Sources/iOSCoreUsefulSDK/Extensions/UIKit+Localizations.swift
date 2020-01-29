//
//  UIKit+Localizations.swift
//

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

