//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var userSettings = SettingManager()
    
    var body: some View {
        Group {
            if userSettings.isLoggedIn {
                ContentView(userSettings: userSettings)
            } else {
                LoginView(userSettings: userSettings)
            }
        } 
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
