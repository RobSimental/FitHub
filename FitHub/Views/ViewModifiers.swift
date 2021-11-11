//
//  ViewModifiers.swift
//  FitHub
//
//  Created by Roberto on 11/10/21.
//

import SwiftUI

struct inputTextBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(5)
            .padding(.bottom,20)
    }
}

struct loginButton: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(color)
            .cornerRadius(15.0)
    }
}

//adding View Modifiers to View to make code more readable in Views
extension View {
    func inputTextBoxStyle() -> some View {
        modifier(inputTextBox())
    }
    func loginButtonStyle(color: Color) -> some View {
        modifier(loginButton(color: color))
    }
}
