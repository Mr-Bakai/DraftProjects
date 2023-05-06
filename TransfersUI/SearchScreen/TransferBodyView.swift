//
//  TransferBodyView.swift
//  TransfersUI
//
//  Created by Bakai on 6/2/23.
//

import SwiftUI


struct TransferBodyView: View {
    private let title: String
    private let model: [TransfersCellViewModel]
    
    public init(title: String, model: [TransfersCellViewModel]) {
        self.title = title
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.system(size: 20, weight: .bold)).padding(.bottom, 16)
            
            ForEach(model) { model in
                createSectionWithCells(model)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
    
    private func createSectionWithCells(_ model: TransfersCellViewModel) -> some View {
        Group {
            Text(model.titleText).font(.system(size: 16, weight: .bold)).padding(.bottom, 16)
            
            ForEach(model.models, id: \.id) { model in
                defaultCellStyle(model)
            }
            Spacer().frame(height: 32)
        }
    }
    
    private func defaultCellStyle(_ model: TransfersCellViewModel.TransferCellModel) -> some View {
        Button {
            
        } label: {
            HStack {
                Image(model.imageName)
                    .frame(width: 40, height: 40)
                DescriptionH1MediumView(title: model.title, size: .size16, color: .black)
                Spacer()
                Image("chevron_right")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.black)
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.horizontal, 4)
    }
}

struct TransferBodyView_Previews: PreviewProvider {
    static var previews: some View {
        TransferBodyView(title: "Переводы",
                         model: TransfersCellViewModel.sampleData)
    }
}
