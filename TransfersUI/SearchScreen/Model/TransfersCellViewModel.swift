//
//  TransfersCellViewModel.swift
//  TransfersUI
//
//  Created by Bakai on 6/2/23.
//

import SwiftUI

public struct TransfersCellViewModel: Identifiable {
    public let id = UUID()
    public let titleText: String
    public let models: [TransferCellModel]
    
    public init(
        titleText: String,
        models: [TransferCellModel]
    ) {
        self.titleText = titleText
        self.models = models
    }
    
    public struct TransferCellModel {
        let id = UUID()
        public let imageName: String
        public let title: String
        
        public init(imageName: String, title: String) {
            self.imageName = imageName
            self.title = title
        }
    }
}

extension TransfersCellViewModel {
    
    static let sampleData: [TransfersCellViewModel] = [
        TransfersCellViewModel(titleText: "Себе", models: [TransferCellModel(imageName: "card", title: "Между Счетами"),
                                                           TransferCellModel(imageName: "home", title: "Из другого банка"),
                                                           TransferCellModel(imageName: "line.phone", title: "Обмен валют"),
                                                           TransferCellModel(imageName: "card", title: "По номеру карты/счета"),
                                                           TransferCellModel(imageName: "visa", title: "Моментальный VISA2VISA"),
                                                           TransferCellModel(imageName: "som", title: "Межбанковский в сомах"),
                                                           TransferCellModel(imageName: "dollar", title: "Межбанковский в валюте"),
                                                           TransferCellModel(imageName: "elcart", title: "Элкарт на Элкарт"),
                                                           TransferCellModel(imageName: "phone", title: "По номеру телефона") ]),
        
        TransfersCellViewModel(titleText: "Людям", models: [TransferCellModel(imageName: "card", title: "Между Счетами"),
                                                           TransferCellModel(imageName: "home", title: "Из другого банка"),
                                                           TransferCellModel(imageName: "line.phone", title: "Обмен валют"),
                                                           TransferCellModel(imageName: "card", title: "По номеру карты/счета"),
                                                           TransferCellModel(imageName: "visa", title: "Моментальный VISA2VISA"),
                                                           TransferCellModel(imageName: "som", title: "Межбанковский в сомах"),
                                                           TransferCellModel(imageName: "dollar", title: "Межбанковский в валюте"),
                                                           TransferCellModel(imageName: "elcart", title: "Элкарт на Элкарт"),
                                                           TransferCellModel(imageName: "phone", title: "По номеру телефона") ]),
        
        TransfersCellViewModel(titleText: "Себе", models: [TransferCellModel(imageName: "card", title: "Между Счетами"),
                                                           TransferCellModel(imageName: "home", title: "Из другого банка"),
                                                           TransferCellModel(imageName: "line.phone", title: "Обмен валют"),
                                                           TransferCellModel(imageName: "card", title: "По номеру карты/счета"),
                                                           TransferCellModel(imageName: "visa", title: "Моментальный VISA2VISA"),
                                                           TransferCellModel(imageName: "som", title: "Межбанковский в сомах"),
                                                           TransferCellModel(imageName: "dollar", title: "Межбанковский в валюте"),
                                                           TransferCellModel(imageName: "elcart", title: "Элкарт на Элкарт"),
                                                           TransferCellModel(imageName: "phone", title: "По номеру телефона") ]),
        
        TransfersCellViewModel(titleText: "Людям", models: [TransferCellModel(imageName: "card", title: "Между Счетами"),
                                                            TransferCellModel(imageName: "home", title: "Из другого банка"),
                                                            TransferCellModel(imageName: "line.phone", title: "Обмен валют"),
                                                            TransferCellModel(imageName: "card", title: "По номеру карты/счета"),
                                                            TransferCellModel(imageName: "visa", title: "Моментальный VISA2VISA"),
                                                            TransferCellModel(imageName: "som", title: "Межбанковский в сомах"),
                                                            TransferCellModel(imageName: "dollar", title: "Межбанковский в валюте"),
                                                            TransferCellModel(imageName: "elcart", title: "Элкарт на Элкарт"),
                                                            TransferCellModel(imageName: "phone", title: "По номеру телефона") ]),
        
        TransfersCellViewModel(titleText: "Себе", models: [TransferCellModel(imageName: "card", title: "Между Счетами"),
                                                           TransferCellModel(imageName: "home", title: "Из другого банка"),
                                                           TransferCellModel(imageName: "line.phone", title: "Обмен валют"),
                                                           TransferCellModel(imageName: "card", title: "По номеру карты/счета"),
                                                           TransferCellModel(imageName: "visa", title: "Моментальный VISA2VISA"),
                                                           TransferCellModel(imageName: "som", title: "Межбанковский в сомах"),
                                                           TransferCellModel(imageName: "dollar", title: "Межбанковский в валюте"),
                                                           TransferCellModel(imageName: "elcart", title: "Элкарт на Элкарт"),
                                                           TransferCellModel(imageName: "phone", title: "По номеру телефона") ]),
        
    ]
}
