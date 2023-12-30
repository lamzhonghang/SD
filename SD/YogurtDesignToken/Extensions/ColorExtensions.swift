//
//  extension.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import SwiftUI
import UIKit

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

extension Color {
    init(light: Color, dark: Color) {
        self.init(light: UIColor(light), dark: UIColor(dark))
    }

    init(light: UIColor, dark: UIColor) {
        self.init(uiColor: UIColor(dynamicProvider: { traits in
            switch traits.userInterfaceStyle {
            case .light, .unspecified:
                return light

            case .dark:
                return dark

            @unknown default:
                assertionFailure("Unknown userInterfaceStyle: \(traits.userInterfaceStyle)")
                return light
            }
        }))
    }
}

extension Color {
    func toUIColor() -> UIColor {
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let uiColor = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }

    func toHex(alpha: Bool = false) -> String {
        let components = self.components()
        let r = Int(components.r * 255)
        let g = Int(components.g * 255)
        let b = Int(components.b * 255)
        let a = Int(components.a * 255)

        if alpha {
            return String(format: "#%02lX%02lX%02lX%02lX", r, g, b, a)
        } else {
            return String(format: "#%02lX%02lX%02lX", r, g, b)
        }
    }
}
