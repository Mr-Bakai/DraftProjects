//
//  LazyGrids.swift
//  TransfersUI
//
//  Created by Bakai on 3/2/23.
//

import SwiftUI

struct LazyGrids: View {
    
    let columnSpec = [ GridItem(.adaptive(minimum: 100))]
    
    let rowSpec =
    [
        
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    let colors: [Color] =
    [
        .green,
        .red,
        .yellow,
        .blue
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columnSpec, spacing:20) {
                    
                    ForEach(1...999, id:\.self) { index in
                        Text("Item \(index)")
                            .padding(EdgeInsets(top: 30,
                                                leading: 15,
                                                bottom: 30,
                                                trailing: 15))
                            .background(colors[index % colors.count])
                            .clipShape(Rectangle())
                    }
                }
            }
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rowSpec, spacing:20) {
                    
                    ForEach(1...999, id:\.self){ index in
                        Text("Item \(index)")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 30,
                                                leading: 15,
                                                bottom: 30,
                                                trailing: 15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
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

struct LazyGrids_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrids()
    }
}
