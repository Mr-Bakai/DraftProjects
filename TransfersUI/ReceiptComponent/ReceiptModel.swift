//
//  ReceiptModel.swift
//  TransfersUI
//
//  Created by Bakai on 8/2/23.
//

import Foundation

struct ReceiptModel: Identifiable, Codable {
    let id: UUID
    var title: String
    
    init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
    }
}

extension ReceiptModel {
    static let sampleData: [ReceiptModel] =
    
    [
        
        ReceiptModel(title: "Квитанция"),
        ReceiptModel(title: "Дата и время"),
        ReceiptModel(title: "Отправитель"),
        ReceiptModel(title: "Получатель"),
        ReceiptModel(title: "Номер телефона"),
        ReceiptModel(title: "Сумма"),
        ReceiptModel(title: "Квитанция"),
        ReceiptModel(title: "Дата и время"),
        ReceiptModel(title: "Отправитель"),
        ReceiptModel(title: "Получатель"),
        ReceiptModel(title: "Номер телефона"),
        ReceiptModel(title: "Сумма")
        
    ]
    
}
