//
//  ButtonModifaire.swift
//  StateAndDataFlow
//
//  Created by Елизавета Медведева on 09.09.2023.
//

import SwiftUI

struct ButtonModifaire: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
        }
        .modifier(color)
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

struct ButtonModifaire_Previews: PreviewProvider {
    static var previews: some View {
        ButtonModifaire(title: "Button", color: .gray, action: {})
    }
}
