//
//  TransferCubeModel.swift
//  TransfersUI
//
//  Created by Bakai on 6/2/23.
//

import SwiftUI

public struct TransferCubeModel: Identifiable {
    public let id = UUID()
    public let image: Image
    public let titleText: String
    
    public init(
        image: Image,
        titleText: String
    ) {
        self.image = image
        self.titleText = titleText
    }
}

extension TransferCubeModel {
    static let sampleData: [TransferCubeModel] =
    [
        TransferCubeModel(image: Image("beeline.kg"), titleText: "Новый шаблон"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "BEELINE SMART REC услуги"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "Мария Иванова"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "Новый шаблон"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "BEELINE SMART REC услуги"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "Новый шаблон"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "BEELINE SMART REC услуги"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "Мария Иванова"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "Новый шаблон"),
        TransferCubeModel(image: Image("beeline.kg"), titleText: "BEELINE SMART REC услуги")
        
    ]
}
