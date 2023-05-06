//
//  TransfersUIApp.swift
//  TransfersUI
//
//  Created by Bakai on 31/1/23.
//

import SwiftUI

@main
struct TransfersUIApp: App {
    
    @State private static var text = ""
    
    let recordTimes: Dictionary =
    
    [
        "Квитанция": "N 14052835",
        "Дата и время": "16.04.2022 19:23",
        "Отправитель": "Алтынай О.К.",
        "Получатель": "MEGA",
        "Номер телефона": "(555) 537 398",
        "Сумма": "200,00 KGS",
        "Сумма включая комиссию": "200,00 KGS"
        
    ]
    
    var body: some Scene {
        WindowGroup {
//            ReceiptView(items: recordTimes) { type in
//                switch type {
//                case .createTemplate:
//                    print("Create Template")
//                case .repeatPay:
//                    print("Repeat Pay")
//                case .share:
//                    print("Share")
//                }
//            }
//            CreateTemplate(action: { _ in })
//            UIPickerInSwiftUI()
//            CreateTemplate(action: { _ in })
//            LoansAddressView()
            PrimaryTextField(title: "asd", text: TransfersUIApp.$text)
        }
    }
}
