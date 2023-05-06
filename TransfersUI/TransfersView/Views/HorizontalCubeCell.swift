//
//  HorizontalCubeCell.swift
//  TransfersUI
//
//  Created by Bakai on 1/2/23.
//

import SwiftUI

struct HorizontalCubeCell: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                createCubeCell()
                createCubeCell()
                createCubeCell()
                createCubeCell()
                createCubeCell()
                createCubeCell()
                createCubeCell()
            }
        }
    }
    
    func createCubeCell() -> some View {
        VStack {
            Button {
                print("Action")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.gray)
                    VStack {
                        Image("beeline.kg")
                        Text("Мария \nИвановна")
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }.frame(width: 108, height: 110)
    }
}

struct HorizontalCubeCell_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCubeCell()
    }
}
