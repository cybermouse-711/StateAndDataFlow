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
                Button(
                    "\(timer.buttonTitle)", action: timer.startTimer)
                    .modifier(.red)
             
                Button("Login Out", action: userSettings.deletedName)
                    .modifier(.blue)
            }
           
            Spacer()
        }
        .padding()
    }
}

struct ButtonView: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

extension View {
    func modifier(_ color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: ButtonView(color: color)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var userSettings = SettingManager()
    static var previews: some View {
        ContentView(userSettings: userSettings)
    }
}
