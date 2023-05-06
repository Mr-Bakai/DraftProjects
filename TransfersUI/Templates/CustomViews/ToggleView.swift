//
//  ToggleView.swift
//  TransfersUI
//
//  Created by Bakai on 15/2/23.
//

import SwiftUI

struct ToggleView: View {
    @State private var showText = false
    
    var body: some View {
        toggle()
    }
    
    private func toggle() -> some View {
        VStack {
            Toggle(isOn: $showText){
                Text("Регулярный платеж")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 22)
        .background(
            Rectangle()
                .fill(Color.gray)
                .cornerRadius(20)
        )
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
