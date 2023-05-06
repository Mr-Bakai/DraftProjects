//
//  HomeView.swift
//  TransfersUI
//
//  Created by Bakai on 4/2/23.
//

import SwiftUI

struct HomeView: View {
    let games = ["Doom", "Final F","Cyberpunk",
                 "avengers", "animal trivia",
                 "sudoku", "snakes and ladders",
                 "Power rangers", "ultimate frisbee",
                 "football", "soccer", "much more"]
    
    var body: some View {
        NavigationView {
            List {
                if #available(iOS 15.0, *) {
                    ForEach(games, id: \.self){ game in
                        Text(game).padding()
                    }.swipeActions(allowsFullSwipe: true) {
                        Button {
                            
                        } label: {
                            Text("Delete")
                        }
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
