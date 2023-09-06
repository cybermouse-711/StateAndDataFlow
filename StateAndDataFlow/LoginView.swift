//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
        }
    }
    
    private func login() {
        if !name.isEmpty {
            userSettings.name = name
            userSettings.isLoggedIn.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
