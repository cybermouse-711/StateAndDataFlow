//
//  SettingManager.swift
//  StateAndDataFlow
//
//  Created by Елизавета Медведева on 08.09.2023.
//

import Foundation
import Combine

final class SettingManager: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @SettingsDefaults(key: "name", defaultValue: "")
    var name: String {
        willSet {
            objectWillChange.send()
        }
    }
    
    @SettingsDefaults(key: "isLoggedIn", defaultValue: false)
    var isLoggedIn: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
    func deletedName() {
        name = ""
        isLoggedIn = false
    }
}

