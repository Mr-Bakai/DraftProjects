//
//  LoansRejected.swift
//  TransfersUI
//
//  Created by Bakai on 15/4/23.
//

import SwiftUI

struct LoansRejected: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack {
                Text("Заявка №MKK4865231")
                Spacer()
                Image("ic_remove")
            }.padding(.horizontal, 20)
            
            VStack {
                Image("ic_cancel")
                Text("Заявка отклонена")
                    .foregroundColor(Color(hex: "#F58240"))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color(hex: "#F58240").opacity(0.08))
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Заявка на кредит от ")
                        .foregroundColor(.gray)
                    + Text("01.02.2023")
                    
                    Text("На сумму ")
                        .foregroundColor(.gray)
                    + Text("55 000 KGS")
                    
                    Text("На срок ")
                        .foregroundColor(.gray)
                    + Text("5 мес")
                }.padding(.top, 24)
                
                HStack(alignment: .top, spacing: 10) {
                    Image("ic_warning")
                    Text("Вы не подтвердили заявку в день \nеё одобрения банком")
                }.padding(.top, 16)
            }.padding(.horizontal, 20)
        }
    }
}

struct LoansRejected_Previews: PreviewProvider {
    static var previews: some View {
        LoansRejected()
    }
}
