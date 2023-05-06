//
//  TransfersNew.swift
//  TransfersUI
//
//  Created by Bakai on 7/2/23.
//

import SwiftUI

struct TransfersNew: View {
    @State private var currentFilter: Filter = .all
    @State private var searchText: String = ""
    @StateObject private var viewModel = NewTransfersViewModel()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor : UIColor.white], for: .selected)
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor : UIColor.gray], for: .normal)
    }
    
    private var currentTransfers: [NewTransferModel] {
        get {
            if currentFilter == .all {
                
                if viewModel.searchText.isEmpty {
                    return NewTransferModel.sampleData
                } else {
                    return viewModel.modelAll
                }
                
            } else if currentFilter == .transfers {
                return viewModel.modelTransfers
            } else {
                return []
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Платежи")
            Picker("Платежи", selection: $currentFilter) {
                ForEach(Filter.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            SearchField(searchText: $viewModel.searchText,
                        placeholder: "Поиск")
            .padding(.horizontal)
            
            makeList(currentTransfers)
            Spacer()
        }
    }
}

private func makeList(_ model: [NewTransferModel]) -> some View {
    ScrollView {
        VStack(alignment: .leading) {
            ForEach(model) { model in
                makeRowView(model)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

private func makeRowView(_ model: NewTransferModel) -> some View {
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
    .padding(4)
}

struct SelectedFilterView: View {
    var selectedOne: Filter
    
    var body: some View {
        switch selectedOne {
        case .all:
            Text("Все")
        case .transfers:
            Text("Переводы")
        }
    }
}

enum Filter: String, CaseIterable {
    case all = "Все"
    case transfers = "Переводы"
}

struct TransfersNew_Previews: PreviewProvider {
    static var previews: some View {
        TransfersNew()
    }
}
