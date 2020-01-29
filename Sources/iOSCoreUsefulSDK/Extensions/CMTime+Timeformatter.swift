//
//  CMTime+Timeformatter.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 07.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

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
