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
    let key: String
    /// The return value for the property if value cannot be identified by given key in `UserDefaults`.
    let defaultValue: Value
    /// `UserDefaults` database. Default is `standard`.
    var userDefaults: UserDefaults = .standard

    /// Returns wrapped value or sets to `UserDefaults`.
    public var wrappedValue: Value {
        get { userDefaults.value(forKey: key) as? Value ?? defaultValue }
        set { userDefaults.setValue(newValue, forKey: key) }
    }
}

/// Saves given type of optional value to the `UserDefaults`.
@propertyWrapper
public struct UserDefaultsOptionalValue<Value> {
    /// The name of one of the receiver's properties.
    let key: String
    /// `UserDefaults` database. Default is `standard`.
    var userDefaults: UserDefaults = .standard

    /// Returns wrapped value or sets to `UserDefaults`.
    public var wrappedValue: Value? {
        get { userDefaults.value(forKey: key) as? Value }
        set { userDefaults.setValue(newValue, forKey: key) }
    }
}
