//
//  RedBottomSheetView.swift
//  TransfersUI
//
//  Created by Bakai on 20/2/23.
//

import SwiftUI

public struct RedBottomSheetView: View {
    
    private let title: String
    private let description: String
    private let positiveButtonTitle: String
    private let neagativeButtonTitle: String
   
    public init(title: String,
                description: String,
                positiveButtonTitle: String,
                neagativeButtonTitle: String
    ) {
        self.title = title
        self.description = description
        self.positiveButtonTitle = positiveButtonTitle
        self.neagativeButtonTitle = neagativeButtonTitle
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            if !title.isEmpty {
                Text("This is the test one")
            }
            
            if !description.isEmpty {
                DescriptionH4RegularView(title: description)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
            }
            
            if !positiveButtonTitle.isEmpty {
                Button {
                    
                } label: {
                    Text("This is the test one")
                }
            }
            
            if !neagativeButtonTitle.isEmpty {
                Button {
                   
                } label: {
                    Text("This is the test one")
                    .padding(.bottom, 20)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 32)
    }
}
