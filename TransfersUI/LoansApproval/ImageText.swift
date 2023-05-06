//
//  ImageText.swift
//  TransfersUI
//
//  Created by Bakai on 29/3/23.
//

import SwiftUI

struct ImageText: View {
    var body: some View {
        
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        HStack(alignment: .top, spacing: 12) {
                            Image("blank")
                            VStack(spacing: .zero) {
                                Text("Анкета заявления банка")
                                    .font(.system(.body))
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.red)
                                Rectangle()
                                    .frame(height: 1)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.red)
                            }.fixedSize(horizontal: true, vertical: false)
                        }
                        
                        Spacer()
                        
                        HStack(alignment: .top, spacing: 12) {
                            Image("blank")
                            VStack(spacing: .zero) {
                                Text("Анкета заявления банка")
                                    .font(.system(.body))
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.red)
                                Rectangle()
                                    .frame(height: 1)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.red)
                            }.fixedSize(horizontal: true, vertical: false)
                        }
                    }.frame(minHeight: geometry.size.height)
                }.frame(width: geometry.size.width)
            }
        
    }
}

struct ImageText_Previews: PreviewProvider {
    static var previews: some View {
        ImageText()
    }
}
