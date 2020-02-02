// CMTime+Timeformatter.swift
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
import AVKit

public extension CMTime {
    
    /// Returns readable time value.
    /// - returns: time value as `String`
    func getTimeLabel() -> String {
        guard !self.seconds.isNaN else { return "00:00"}
        let minutes = Int(self.seconds/60.0)
        let secs = Int(self.seconds) - (minutes*60)
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let secsStr = secs < 10 ? "0\(secs)" : "\(secs)"
        return "\(minutesStr):\(secsStr)"
    }
    
    /// Returns CMTime with adding specified interval.
    static func + (lhs: CMTime, rhs: TimeInterval) -> CMTime {
        return CMTime(seconds: lhs.seconds + rhs,
                      preferredTimescale: lhs.timescale)
    }
    /// Adds time interval to CMTime object.
    static func += (lhs: inout CMTime, rhs: TimeInterval) {
        lhs = CMTime(seconds: lhs.seconds + rhs,
                     preferredTimescale: lhs.timescale)
    }
    /// Returns CMTime with decreasing specified interval.
    static func - (lhs: CMTime, rhs: TimeInterval) -> CMTime {
        return CMTime(seconds: lhs.seconds - rhs,
                      preferredTimescale: lhs.timescale)
    }
     /// Decreases CMTime object with the given time interval.
    static func -= (lhs: inout CMTime, rhs: TimeInterval) {
        lhs = CMTime(seconds: lhs.seconds - rhs,
                     preferredTimescale: lhs.timescale)
    }
    
}
