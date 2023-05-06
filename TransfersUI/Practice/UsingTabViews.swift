//
//  UsingTabViews.swift
//  TransfersUI
//
//  Created by Bakai on 4/2/23.
//

import SwiftUI

struct UsingTabViews: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }.tabViewStyle(.page)
            CurrenciesView()
                .tabItem{
                    Label("Currencies", systemImage:
                            "coloncurrencysign.circle.fill" )
                }.tabViewStyle(.page)
        }
    }
}

struct UsingTabViews_Previews: PreviewProvider {
    static var previews: some View {
        UsingTabViews()
    }
}
