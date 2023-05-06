//
//  NewTransfersViewModel.swift
//  TransfersUI
//
//  Created by Bakai on 7/2/23.
//

import Foundation

class NewTransfersViewModel: ObservableObject {
    @Published var modelAll: [NewTransferModel] = []
    @Published var modelTransfers: [NewTransferModel] = []
    
    @Published var searchText = "" {
        didSet {
            self.searchWithin()
        }
    }
    
    private func searchWithin() {
        self.modelAll = searchText.isEmpty ? NewTransferModel.sampleData : NewTransferModel.sampleData.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        
        self.modelTransfers = searchText.isEmpty ? NewTransferModel.sampleData : NewTransferModel.sampleData.filter { $0.title.lowercased().contains(searchText.lowercased()) }
    }
}
