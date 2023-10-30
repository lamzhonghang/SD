//
//  Extension.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

//extension View {
//    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
//        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
//    }
//}
//
//struct EdgeBorder: Shape {
//    var width: CGFloat
//    var edges: [Edge]
//
//    func path(in rect: CGRect) -> Path {
//        edges.map { edge -> Path in
//            switch edge {
//            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
//            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
//            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
//            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
//            }
//        }.reduce(into: Path()) { $0.addPath($1) }
//    }
//}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
