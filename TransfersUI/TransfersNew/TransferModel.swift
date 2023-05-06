//
//  TransferModel.swift
//  TransfersUI
//
//  Created by Bakai on 7/2/23.
//

import Foundation

struct NewTransferModel: Identifiable, Codable {
    let id: UUID
    var title: String
    var imageName: String
    
    init(id: UUID = UUID(), title: String, imageName: String) {
        self.id = id
        self.title = title
        self.imageName = imageName
    }
}

extension NewTransferModel {
    static let sampleData: [NewTransferModel] =
    
    [
        
        NewTransferModel(title: "Между счетами", imageName: "home" ),
        NewTransferModel(title: "Из другого банка",  imageName: "line.phone"),
        NewTransferModel(title: "Обмен валют", imageName: "card"),
        NewTransferModel(title: "По номеру карты/счета",  imageName: "visa"),
        NewTransferModel(title: "Моментальный VISA2VISA", imageName: "som"),
        NewTransferModel(title: "Межбанковский в сомах",  imageName: "dollar"),
        NewTransferModel(title: "Межбанковский в валюте",  imageName: "elcart"),
        NewTransferModel(title: "Элкарт на Элкарт",  imageName: "phone"),
        NewTransferModel(title: "По номеру телефона",  imageName: "home"),
        NewTransferModel(title: "Между счетами",  imageName: "line.phone" ),
        NewTransferModel(title: "Из другого банка", imageName: "card"),
        NewTransferModel(title: "Обмен валют",  imageName: "visa"),
        NewTransferModel(title: "По номеру карты/счета",  imageName: "som"),
        NewTransferModel(title: "Моментальный VISA2VISA",  imageName: "dollar"),
        NewTransferModel(title: "Межбанковский в сомах",  imageName: "elcart"),
        NewTransferModel(title: "Межбанковский в валюте",  imageName: "phone"),
        NewTransferModel(title: "Элкарт на Элкарт",  imageName: "som"),
        NewTransferModel(title: "По номеру телефона",  imageName: "home")
        
    ]
    
}
