//
//  TabBarView.swift
//  TransfersUI
//
//  Created by Bakai on 6/2/23.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                HomeView()
                    .accentColor(Color.red)
                    .tabItem {
                        Image("main")
                        Text("Главная")
                    }
                    .tag(1)
                
                TransferMainView()
                    .tabItem {
                        Image("transfers")
                        Text("Переводы")
                    }
                    .tag(2)
                
                Text("Coming soon")
                    .foregroundColor(Color.green)
                    .tabItem {
                        Image("payments")
                        Text("Платежи")
                    }
                    .tag(3)
                
                Text("Coming soon")
                    .foregroundColor(Color.red)
                    .tabItem {
                        Image("history")
                        Text("История")
                    }
                    .tag(4)
                
                Text("Coming soon")
                    .foregroundColor(Color.blue)
                    .tabItem {
                        Image("more")
                        Text("Еще")
                    }
                    .tag(5)
                
                TransfersNew()
                    .tabItem {
                        Image("transfers")
                        Text("Переводы")
                    }
                    .tag(6)
            }
            .accentColor(Color.pink)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
