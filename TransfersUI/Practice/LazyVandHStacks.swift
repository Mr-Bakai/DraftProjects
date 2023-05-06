//
//  LazyVandHStacks.swift
//  TransfersUI
//
//  Created by Bakai on 3/2/23.
//

import SwiftUI

struct LazyVandHStacks: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1...1000, id: \.self) { item in
                        ListRow(id: item, type: "Horizontal")
                    }
                }
            }
            .frame(height: 100, alignment: .center)
            
            ScrollView {
                LazyVStack {
                    ForEach(1...10000, id:\.self){ item in
                        ListRow(id: item, type: "Vertical")
                    }
                }
            }
        }
    }
}

struct LazyVandHStacks_Previews: PreviewProvider {
    static var previews: some View {
        LazyVandHStacks()
    }
}


struct ListRow: View {
    let id: Int
    let type: String
    
    init(id: Int, type: String){
        print("Loading \(type) item \(id)")
        self.id = id
        self.type = type
    }
    
    var body: some View {
        Text("\(type) \(id)").padding()
    }
}
