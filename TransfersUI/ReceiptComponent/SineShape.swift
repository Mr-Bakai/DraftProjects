//
//  SineShape.swift
//  TransfersUI
//
//  Created by Bakai on 10/2/23.
//

import SwiftUI

struct SineShape: View {
    
    var graphWidth: CGFloat = 0.0
    var amplitude: CGFloat = 0.0
    
    public init(graphWidth: CGFloat, amplitude: CGFloat ) {
        self.graphWidth = graphWidth
        self.amplitude = amplitude
    }
    
    var body: some View {
        WaveShape(graphWidth: graphWidth, amplitude: amplitude)
            .frame(height: 6)
            .foregroundColor(.white)
            .clipped()
    }
}

struct WaveShape: Shape {
    
    var graphWidth: CGFloat = 0.0
    var amplitude: CGFloat = 0.0
    
    public init(graphWidth: CGFloat, amplitude: CGFloat ) {
        self.graphWidth = graphWidth
        self.amplitude = amplitude
    }
    
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        
        let origin = CGPoint(x: 0, y: height * 0.50)
        
        var path = Path()
        path.move(to: origin)
        
        var endY: CGFloat = 0.0
        
        let step = 5.0
        
        for angle in stride(from: step,
                            through: Double(width) * (step * step),
                            by: step) {
            
            let x = origin.x + CGFloat(angle/360.0) * width * graphWidth
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
            endY = y
            
        }
        path.addLine(to: CGPoint(x: width, y: endY))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: origin.y))
        
        UIColor.red.setFill()
        path.closeSubpath()
        
        return path
    }
}


//struct SineShape_Previews: PreviewProvider {
//    static var previews: some View {
//        SineShape(graphWidth: 0.08, amplitude: 0.5)
//    }
//}
