//
//  TransferMainView.swift
//  TransfersUI
//
//  Created by Bakai on 6/2/23.
//

import SwiftUI

struct TransferMainView: View {
    @State var text = "Test"
    @StateObject private var viewModel = CategoriesSearchViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: "#AAAAAA").opacity(0.10).ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    SearchField(searchText: $viewModel.searchText).padding(.horizontal, 8)
                    TransfersWithHeader()
                    HorizontalScrollViewWithCubes(models: TransferCubeModel.sampleData)
                    CustomAutoTransferView()
                    
                    TransferBodyView(title: "Перевести",
                                     model: TransfersCellViewModel.sampleData)
                    
                    TransfersSampleScreen(viewModel: self.viewModel)
                    
                }
            }
        }
    }
}

struct TransferMainView_Previews: PreviewProvider {
    static var previews: some View {
        TransferMainView()
    }
}
