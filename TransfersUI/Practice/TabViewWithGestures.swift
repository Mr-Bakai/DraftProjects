//
//  TabViewWithGestures.swift
//  TransfersUI
//
//  Created by Bakai on 4/2/23.
//

import SwiftUI

struct TabViewWithGestures: View {
    @State private var tabSelected = 0
    
    var body: some View {
        TabView(selection: $tabSelected){
            Text("Left Tab. Click to switch to right")
                .onTapGesture {
                    self.tabSelected = 1
                }.tag(0)
                .tabItem{
                    Label("Left", systemImage: "l.circle.fill")
                }
            Text("Right Tab. Click to switch to left")
                .onTapGesture {
                    self.tabSelected = 0
                }
                .tabItem{
                    Label("Right",systemImage: "r.circle.fill")
                }.tag(1)
        }
    }
}

struct TabViewWithGestures_Previews: PreviewProvider {
    static var previews: some View {
        TabViewWithGestures()
    }
}
