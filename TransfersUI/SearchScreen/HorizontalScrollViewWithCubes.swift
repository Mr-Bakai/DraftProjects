//
//  HorizontalScrollViewWithCubes.swift
//  TransfersUI
//
//  Created by Bakai on 6/2/23.
//

import SwiftUI

struct HorizontalScrollViewWithCubes: View {
    private let models: [TransferCubeModel]
    
    public init(models: [TransferCubeModel]) {
        self.models = models
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(models) { model in
                    createCubeCell(model)
                }
            }
        }
    }
    
    private func createCubeCell(_ model: TransferCubeModel) -> some View {
        VStack {
            Button {
                print("Cube Tapped")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                    VStack {
                        model.image
                            .resizable()
                            .frame(width: 32, height: 32)
                            .aspectRatio(contentMode: .fit)
                        
                        Text(model.titleText)
                            .foregroundColor(.black)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            
                    }
                    .padding(12)
                }
            }
        }
        .frame(width: 108, height: 110)
    }
}

struct HorizontalScrollViewWithCubes_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollViewWithCubes(models: TransferCubeModel.sampleData)
    }
}
