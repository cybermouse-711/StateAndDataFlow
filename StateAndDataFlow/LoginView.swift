//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var userSettings: SettingManager
    @AppStorage("name") var name = ""
    @State private var countName = 0
    
    var body: some View {
        HStack {
            VStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Button(action: login) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("Ok")
                    }
                }.disabled(!checkName())
            }.padding(.leading)
            
            Text(countName.formatted())
                .foregroundColor(.gray) //здест нет цвета
                .padding(.trailing)
        }
    }
    
    private func login() {
        if !name.isEmpty {
            userSettings.name = name
            userSettings.isLoggedIn.toggle()
        }
    }
    
    private func checkName() -> Bool {
        name.count >= 3
    }
}

struct LoginView_Previews: PreviewProvider {
    static var userSettings = SettingManager()
    static var previews: some View {
        LoginView(userSettings: userSettings)
    }
}
