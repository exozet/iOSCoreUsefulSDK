// LoggingManager.swift
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

/// Any service that apps are using can share logs via using this service methods
///
/// The `delegate` property should be set in the app in order to receive given logs.
open class LoggingManager {
    
    /// Logs from the all services of the `iOSCoreUsefulSDK` or other services that choses public methods of the `LoggingManager` can be listened from setting a delegate.
    open class var delegate: LoggingDelegate? {
        set { LoggingManager.sharedInstance.logDelegate = newValue }
        get { return LoggingManager.sharedInstance.logDelegate }
    }
    
    private weak var logDelegate: LoggingDelegate?
    
    /// Singleton instance of the service.
    private static var sharedInstance = LoggingManager()
    
    /// Private initializer
    private init() {
    }
    
    /**
     Logs info message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    open class func info(message: String, domain: LogDomain, function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: message, level: .info, domain: domain, function: function, line: line, file: file)
    }
    
    /**
     Logs warning message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    open class func warning(message: String, domain: LogDomain, function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: message, level: .warning, domain: domain, function: function, line: line, file: file)
    }
    
    /**
     Logs error message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    open class func error(message: String, domain: LogDomain, function: String = #function, line: Int = #line,
                            file: String = #file,
                            tracking: (code: Int, name: String)? = nil) {
        LoggingManager.sharedInstance.log(message: message, level: .error, domain: domain, function: function, line: line, file: file)
    }
    
    /**
     Logs verbose message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    open class func verbose(message: String, domain: LogDomain, function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: message, level: .verbose, domain: domain, function: function, line: line, file: file)
    }
    
    /**
     Logs `Method started` message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    open class func methodStarted(function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: "Method started", level: .verbose, domain: .app, function: function, line: line, file: file)
    }
    
    /**
     Logs `function called` message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    open class func methodCalled(function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: "Function called", level: .verbose, domain: .app, function: function, line: line, file: file)
    }
    
    /**
     Logs `Method Finished` message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    open class func methodFinished(function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: "Method finished", level: .verbose, domain: .app, function: function, line: line, file: file)
    }
    
    /**
     Logs message
     - parameter message: Message for the log
     - parameter level: Loglevel
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    open func log(message: String, level: LogLevel, domain: LogDomain, function: String = #function, line: Int = #line, file: String = #file) {
        let fileName = file.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? ""
        LoggingManager.sharedInstance.logDelegate?.log(message: message, level: level,
                                                       domain: domain,
                                                       source: "\(fileName).\(function).\(line)")
    }
}
