//
//  DispatchQueue+Utils.swift
//  DigitalAssortmentPlanner
//
//  Created by Philipp Homann on 28.10.20.
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

import Foundation

// https://stackoverflow.com/questions/24056205/how-to-use-background-thread-in-swift

// usage:
/*
 DispatchQueue.background(delay: 3.0, background: {
     // do something in background
 }, completion: {
     // when background job finishes, wait 3 seconds and do something in main thread
 })

 DispatchQueue.background(background: {
     // do something in background
 }, completion:{
     // when background job finished, do something in main thread
 })

 DispatchQueue.background(delay: 3.0, completion:{
     // do something in main thread after 3 seconds
 })
 */
 

public extension DispatchQueue {

    /// Starts a background queue with completion handler
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
}
