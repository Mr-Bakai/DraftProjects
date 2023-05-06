//
//  AutoTransferView.swift
//  TransfersUI
//
//  Created by Bakai on 2/2/23.
//

import SwiftUI

struct AutoTransferView: View {
    var body: some View {
        ScrollView {
            VStack {
                CustomAutoTransferView()
                Spacer()
            }
        }
    }
}

struct AutoTransferView_Previews: PreviewProvider {
    static var previews: some View {
        AutoTransferView()
    }
}

struct CustomAutoTransferView: View {
    var body: some View {
        Button {
            
        } label: {
            Rectangle()
                .fill(.white)
                .frame(height: 47) // size to be fixed
                .cornerRadius(30)
                .overlay(
                    Text("Автопереводы")
                        .padding([.top, .bottom], 12)
                        .foregroundColor(.black)
                )
        }
        .padding()
    }
}
