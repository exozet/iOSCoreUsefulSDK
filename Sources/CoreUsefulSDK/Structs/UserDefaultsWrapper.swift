//
//  UserDefaultsWrapper.swift
//  
//
//  Created by Burak Uzunboy on 14.07.20.
//

import Foundation

/// Saves given type of non-optional value to the `UserDefaults`.
@propertyWrapper
public struct UserDefaultsValue<Value> {
    /// The name of one of the receiver's properties.
    public let key: String
    /// The return value for the property if value cannot be identified by given key in `UserDefaults`.
    public let defaultValue: Value
    /// `UserDefaults` database. Default is `standard`.
    public var userDefaults: UserDefaults

    /// Returns wrapped value or sets to `UserDefaults`.
    public var wrappedValue: Value {
        get { userDefaults.value(forKey: key) as? Value ?? defaultValue }
        set { userDefaults.setValue(newValue, forKey: key) }
    }
    
    /// Initializes Wrapper struct.
    /// - Parameters:
    ///   - key: The name of one of the receiver's properties.
    ///   - defaultValue: The return value for the property if value cannot be identified by given key in `UserDefaults`.
    ///   - userDefaults: `UserDefaults` database. Default is `standard`.
    public init(key: String,
                defaultValue: Value,
                userDefaults: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
    }
}

/// Saves given type of optional value to the `UserDefaults`.
@propertyWrapper
public struct UserDefaultsOptionalValue<Value> {
    /// The name of one of the receiver's properties.
    public let key: String
    /// `UserDefaults` database. Default is `standard`.
    public var userDefaults: UserDefaults

    /// Returns wrapped value or sets to `UserDefaults`.
    public var wrappedValue: Value? {
        get { userDefaults.value(forKey: key) as? Value }
        set { userDefaults.setValue(newValue, forKey: key) }
    }
    
    /// Initializes Wrapper struct.
    /// - Parameters:
    ///   - key: The name of one of the receiver's properties.
    ///   - defaultValue: The return value for the property if value cannot be identified by given key in `UserDefaults`.
    ///   - userDefaults: `UserDefaults` database. Default is `standard`.
    public init(key: String,
                userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
    }
}

/// Saves given type of optional value to the `UserDefaults`.
@propertyWrapper
public struct UserDefaultsRawRepresentableValue<Value: RawRepresentable> {
    /// The name of one of the receiver's properties.
    public let key: String
    /// `UserDefaults` database. Default is `standard`.
    public var userDefaults: UserDefaults

    /// Returns wrapped value or sets to `UserDefaults`.
    public var wrappedValue: Value? {
        get { (userDefaults.value(forKey: key) as? Value.RawValue).flatMap({ Value(rawValue: $0) }) }
        set { userDefaults.setValue(newValue?.rawValue, forKey: key) }
    }
    
    /// Initializes Wrapper struct.
    /// - Parameters:
    ///   - key: The name of one of the receiver's properties.
    ///   - defaultValue: The return value for the property if value cannot be identified by given key in `UserDefaults`.
    ///   - userDefaults: `UserDefaults` database. Default is `standard`.
    public init(key: String,
                userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
    }
}
