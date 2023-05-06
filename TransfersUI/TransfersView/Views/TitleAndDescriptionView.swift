//
//  TitleAndDescriptionView.swift
//  TransfersUI
//
//  Created by Bakai on 1/2/23.
//

import SwiftUI

struct TitleAndDescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Переводы")
                .font(.system(size: 28, weight: .bold))
            HStack {
                Text("Шаблоны и автоплатежи")
                .font(.system(size: 20, weight: .bold))
                Spacer()
                Text("Все")
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.top, 16)
        }
        .padding()
    }
}

struct TitleAndDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        TitleAndDescriptionView().previewLayout(.sizeThatFits)
    }
}
