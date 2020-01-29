//
//  File.swift
//  
//
//  Created by Burak Uzunboy on 29.01.20.
//

import Foundation

/// Available domain types for the logs.
public enum LogDomain: Int {
    /// app domain
    case app
    /// view domain
    case view
    /// layout domain
    case layout
    /// controller domain
    case controller
    /// routing domain
    case routing
    /// service domain
    case service
    /// network domain
    case network
    /// data model domain
    case model
    /// cache domain
    case cache
    /// database domain
    case db
    /// input/output domain
    case io
}

/// Available log levels.
public enum LogLevel: String {
    /// minimum level of logs
    case verbose
    /// standard level of logs
    case info
    /// warning level
    case warning
    /// level for error logs
    case error
}
