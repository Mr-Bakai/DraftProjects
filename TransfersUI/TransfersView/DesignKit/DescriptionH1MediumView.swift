//
//  DescriptionH1MediumView.swift
//  TransfersUI
//
//  Created by Bakai on 31/1/23.
//

import SwiftUI

public struct DescriptionH1MediumView: View {
    private let title: String
    private let size: FontSize
    private let color: Color
    
    public init(title: String,
                size: FontSize = .size20,
                color: Color = .black) {
        self.title = title
        self.size = size
        self.color = color
    }
    
    public var body: some View {
        Text(title)
            .foregroundColor(color)
            .font(AppFonts.textFont(weight: .medium, size: size))
    }
}

public struct DescriptionH4RegularView: View {
    private let title: String
    private let fontSize: FontSize
    private let fontColor: Color
    
    public init(
        title: String,
        fontSize: FontSize = .size16,
        fontColor: Color = .black
    ) {
        self.title = title
        self.fontSize = fontSize
        self.fontColor = fontColor
    }
    
    public var body: some View {
        Text(title)
            .foregroundColor(fontColor)
            .font(AppFonts.textFont(weight: .regular, size: fontSize))
            .lineLimit(100)
    }
}
