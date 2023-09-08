//
//  SettingsDefaults.swift
//  StateAndDataFlow
//
//  Created by Елизавета Медведева on 08.09.2023.
//

import Foundation

@propertyWrapper
struct SettingsDefaults <T> {
    let key: String
    let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
