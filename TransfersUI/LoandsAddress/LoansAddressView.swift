//
//  LoansAddressView.swift
//  TransfersUI
//
//  Created by Bakai on 22/3/23.
//

import SwiftUI

struct LoansAddressView: View {
    @State private var text = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Фактический адрес проживания")
            
            textFields
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    
    private var textFields: some View {
        VStack(spacing: 24) {
            CustomTextField(text: $text)
            CustomTextField(text: $text)
            CustomTextField(text: $text)
            CustomTextField(text: $text)
        }
    }
}

struct LoansAddressView_Previews: PreviewProvider {
    static var previews: some View {
        LoansAddressView()
    }
}

struct CustomTextField: View {
    let text: Binding<String>
    
    var body: some View {
        VStack {
            TextField("", text: text)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .foregroundColor(.gray)
        .background(
            Rectangle()
                .fill(Color(hex: "#999BA3").opacity(0.08))
                .cornerRadius(10)
        )
    }
}


