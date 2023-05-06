//
//  SearchField.swift
//  TransfersUI
//
//  Created by Bakai on 4/2/23.
//

import SwiftUI

struct SearchField: View {
    @Binding var searchText: String
    var placeholder: LocalizedStringKey = "Search..."

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
            TextField(placeholder, text: $searchText)
                .foregroundColor(Color.black)
                .font(.headline)
                .accentColor(.gray)
                .textCase(nil)
            if !searchText.isEmpty {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.headline)
                        .foregroundColor(.red)
                        .imageScale(.large)
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
        .padding(8)
        .background(Color(hex: "#EEEDF0"))
        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .padding(2)
        .listRowBackground(Color.purple)
    }
}
