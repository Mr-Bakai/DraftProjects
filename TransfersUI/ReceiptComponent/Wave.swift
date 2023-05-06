//
//  Wave.swift
//  TransfersUI
//
//  Created by Bakai on 8/2/23.
//

import SwiftUI

struct Wave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: .zero)

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        // Curve
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.74, y: rect.midY),
                      control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY * 1.25))

        path.closeSubpath()

        return path
    }
}

struct Wave_Previews: PreviewProvider {
    static var previews: some View {
        
        Wave()
            .stroke(Color.red, lineWidth: 5)
            .padding()
    }
}
