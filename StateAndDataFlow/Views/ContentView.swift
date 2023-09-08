//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userSettings: SettingManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(userSettings.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            VStack {
                ButtonModifaire(
                    title: "\(timer.buttonTitle)",
                    color: .red,
                    action: timer.startTimer
                ).padding(.bottom)
                
                ButtonModifaire(
                    title: "Login Out",
                    color: .blue,
                    action: userSettings.deletedName
                )
            }
           
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var userSettings = SettingManager()
    static var previews: some View {
        ContentView(userSettings: userSettings)
    }
}
