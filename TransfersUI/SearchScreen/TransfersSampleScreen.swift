//
//  TransfersScreen.swift
//  TransfersUI
//
//  Created by Bakai on 4/2/23.
//

import SwiftUI

struct TransfersSampleScreen: View {
    // MARK: - Vars
    @ObservedObject var viewModel: CategoriesSearchViewModel
    
    // MARK: - Computed vars
    private var searchCategories: [DailyScrum] {
        viewModel.searchResults.map { $0 }
    }
    
    var body: some View {
        VStack {
            Section(header: SearchField(searchText: $viewModel.searchText)) {

                if viewModel.searchText.isEmpty {
                    ForEach(DailyScrum.sampleData, id: \.id, content: itemRow)
                } else {
                    if viewModel.isLoadingData {
                        //TODO: show loading view
                    } else if searchCategories.isEmpty {
                        Text("No results for \(viewModel.searchText)").foregroundColor(.gray)
                    } else {
                        ForEach(searchCategories, id: \.id, content: itemRow)
                    }
                }
            }
        }
        .animation(.interactiveSpring())
    }
    
    func itemRow(_ item: DailyScrum) -> some View {
        Button {
            // TODO: Handle Click
        } label: {
            HStack {
                Image("card")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                DescriptionH1MediumView(title: item.title, size: .size16, color: .black)
                Spacer()
                Image("chevron_right")
            }
        }
    }
    
    struct CellModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(.all)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color("#404040").opacity(0.1), radius: 12, x: 0, y: 2)
        }
    }
}

struct TransfersScreen_Previews: PreviewProvider {
    @StateObject static var viewModel = CategoriesSearchViewModel()
    
    static var previews: some View {
        TransfersSampleScreen(viewModel: self.viewModel)
    }
}
