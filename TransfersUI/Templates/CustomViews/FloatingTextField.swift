//
//  FloatingTextField.swift
//  TransfersUI
//
//  Created by Bakai on 15/2/23.
//

import SwiftUI

struct FloatingTextField: View {
    let title: String
    let text: Binding<String>
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(text.wrappedValue.isEmpty ? Color(.placeholderText) : .gray)
                .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
            TextField("", text: text)
        }
        .padding(.top, 15)
        .animation(.spring(response: 0.4, dampingFraction: 0.4))
    }
}

struct FloatingTextField2: View {
    let title: String
    let text: Binding<String>
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(text.wrappedValue.isEmpty ? Color(.placeholderText) : .gray)
                .offset(y: text.wrappedValue.isEmpty ? 0 : -30)
                .offset(x: text.wrappedValue.isEmpty ? 0 : -40)
                .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
            TextField("", text: text)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color(hex: "#1D1D1F"))
                .font(AppFonts.textFont(weight: .medium, size: .size18))
                .multilineTextAlignment(.center)
                .disabled(true)
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.4))
    }
}
