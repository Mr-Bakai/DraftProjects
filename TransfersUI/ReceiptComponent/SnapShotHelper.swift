//
//  SnapShotHelper.swift
//  TransfersUI
//
//  Created by Bakai on 13/2/23.
//

import Foundation
import UIKit
import SwiftUI


//struct ContentView2: View {
//
//    var body: some View {
//        ScrollView {
//            VStack {
//                Text("GeometryReader Get Grobal Origin")
//                GeometryRectangle(color: Color.pink)
//
//                GeometryRectangle(color: Color.red)
//                .offset(x: 10, y: 0)
//
//                ZStack {
//                    GeometryRectangle(color: Color.blue)
//                        .offset(x: 30, y: 0)
//                }
//            }
//        }
//    }
//}
//
//struct GeometryRectangle: View {
//    var color: Color
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//
//                Button(action: {
//                    let image = self.takeScreenshot(origin: geometry.frame(in: .global).origin, size: geometry.size)
//                    print(image)
//                }) {
//                    RoundedRectangle(cornerRadius: 20)
//                    .fill(self.color)
//                    .overlay(
//                        VStack {
//                            Text("X: \(Int(geometry.frame(in: .global).origin.x)) Y: \(Int(geometry.frame(in: .global).origin.y)) width: \(Int(geometry.frame(in: .global).width)) height: \(Int(geometry.frame(in: .global).height))")
//                                .foregroundColor(.white)
//                            Text("size: \(geometry.size.debugDescription)")
//                                .foregroundColor(.white)
//                })}
//            }
//
//        }.frame(height: 100)
//    }
//}
//
//struct ContentView_Previews2: PreviewProvider {
//    static var previews: some View {
//        ContentView2()
//    }
//}
//
//
//extension UIView {
//    var renderedImage: UIImage {
//        // rect of capure
//        let rect = self.bounds
//        // create the context of bitmap
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
//        let context: CGContext = UIGraphicsGetCurrentContext()!
//        self.layer.render(in: context)
//        // get a image from current context bitmap
//        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return capturedImage
//    }
//}
//
//extension View {
//    func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage {
//        let window = UIWindow(frame: CGRect(origin: origin, size: size))
//        let hosting = UIHostingController(rootView: self)
//        hosting.view.frame = window.frame
//        window.addSubview(hosting.view)
//        window.makeKeyAndVisible()
//        return hosting.view.renderedImage
//    }
//}
//


extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}


extension View {
    var asImage: UIImage {
        // Must ignore safe area due to a bug in iOS 15+ https://stackoverflow.com/a/69819567/1011161
        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.top))
        let view = controller.view
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: targetSize)
        view?.backgroundColor = .clear

        let format = UIGraphicsImageRendererFormat()
        format.scale = 3 // Ensures 3x-scale images. You can customise this however you like.
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
