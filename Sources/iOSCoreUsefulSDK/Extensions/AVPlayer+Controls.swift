//
//  AVPlayer+Controls.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 06.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import AVKit

public extension AVPlayer {
    
    /// Returns `true` if AVPlayer starts to play.
    var isPlaying: Bool {
        return self.rate != 0 && self.error == nil
    }
}
