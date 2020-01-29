//
//  UIApplication+Version.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 24.10.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

public extension Bundle {
    
    /**
     Returns user friendly app version string.
     - returns: Version Information
     */
    class var versionInfo: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        
        guard
            let gitHash = Bundle.main.infoDictionary?["GIT_COMMIT_HASH"] as? String
            else {
                return "\(version ?? "0") (\(build ?? "0"))"
        }
        return "\(version ?? "0") (\(build ?? "0")) - \(gitHash)"
    }
    
}
