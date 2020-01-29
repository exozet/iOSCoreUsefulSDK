//
//  LoggingManager.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 16.09.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

/// Any service that apps are using can share logs via using this service methods
///
/// The `delegate` property should be set in the app in order to receive given logs.
public class LoggingManager {
    
    /// Logs from the all services of the `UsefullSDK` can be listened from setting a delegate to `LoggingManager`.
    class var delegate: LoggingDelegate? {
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
    public class func info(message: String, domain: LogDomain, function: String = #function, line: Int = #line, file: String = #file) {
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
    public class func warning(message: String, domain: LogDomain, function: String = #function, line: Int = #line, file: String = #file) {
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
    public class func error(message: String, domain: LogDomain, function: String = #function, line: Int = #line,
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
    public class func verbose(message: String, domain: LogDomain, function: String = #function, line: Int = #line, file: String = #file) {
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
    public class func methodStarted(function: String = #function, line: Int = #line, file: String = #file) {
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
    public class func methodCalled(function: String = #function, line: Int = #line, file: String = #file) {
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
    public class func methodFinished(function: String = #function, line: Int = #line, file: String = #file) {
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
    public func log(message: String, level: LogLevel, domain: LogDomain, function: String = #function, line: Int = #line, file: String = #file) {
        let fileName = file.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? ""
        LoggingManager.sharedInstance.logDelegate?.log(message: message, level: level,
                                                       domain: domain,
                                                       source: "\(fileName).\(function).\(line)")
    }
}
