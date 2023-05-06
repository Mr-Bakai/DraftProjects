//
//  TransfersWithHeader.swift
//  TransfersUI
//
//  Created by Bakai on 1/2/23.
//

import SwiftUI

struct TransfersWithHeader: View {
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Переводы").font(.system(size: 28, weight: .bold)).padding(.bottom, 16)
                HStack {
                    Text("Шаблоны и автоплатежи").font(.system(size: 20, weight: .bold))
                    Spacer()
                    Text("Все").foregroundColor(.red)
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct TransfersWithHeader_Previews: PreviewProvider {
    static var previews: some View {
        TransfersWithHeader()
    }
}

//struct RoundedContainer: View {
//    var body: some View {
//        Rectangle()
//            .fill(Color.gray)
//            .frame(width: 48, height: 32)
//            .cornerRadius(30)
//            .overlay(
//                Image("chevron_right")
//            )
//    }
//}
