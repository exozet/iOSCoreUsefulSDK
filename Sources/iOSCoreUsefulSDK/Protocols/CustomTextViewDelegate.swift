//
//  CustomTextViewDelegate.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 21.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

/**
 Delegate that have extra methods for the UITextView.
 */
public protocol CustomTextViewDelegate: class {

    /**
     Tells the delegate that TextView is became responder.
     */
    func becameFirstResponder()
}
