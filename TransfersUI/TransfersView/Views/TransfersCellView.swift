//
//  TransfersCellView.swift
//  TransfersUI
//
//  Created by Bakai on 31/1/23.
//

import SwiftUI

struct TransfersCellView: View {
    @Binding var scrums: [DailyScrum]
    let action: (() -> Void)
    var isCategory: Bool
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach($scrums) { $model in
                createPartnerCell(model)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Text("magnifier")
                }
            }
        }
    }
    
    func createPartnerCell(_ item: DailyScrum) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Image("card")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                DescriptionH1MediumView(title: item.title, size: .size16, color: .black)
                Spacer()
                Image("chevron_right")
            }
        }
        .if(!isCategory) { view in
            view.modifier(CellModifier())
        }
    }
    
    struct CellModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(.all)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color("#404040").opacity(0.1), radius: 12, x: 0, y: 2)
        }
    }
}

struct TransfersCellView_Previews: PreviewProvider {
    static var previews: some View {
        TransfersCellView(scrums: .constant(DailyScrum.sampleData),
                          action: {},
                          isCategory: false
        )
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
