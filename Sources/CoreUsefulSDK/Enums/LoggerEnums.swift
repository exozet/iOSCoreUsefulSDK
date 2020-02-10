// LoggerEnums.swift
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
