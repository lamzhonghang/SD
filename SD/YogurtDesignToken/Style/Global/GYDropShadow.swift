//
//  GYShadow.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/20.
//

import Foundation
import SwiftUI

struct ShadowStyle {
    var x: CGFloat
    var y: CGFloat
    var radius: CGFloat
    var color: Color
}

enum GYDropShadow: String, CaseIterable {
    case elevationL4 = "Elevation 4"
    case elevationL3 = "Elevation 3"
    case elevationL2 = "Elevation 2"
    case elevationL1 = "Elevation 1"
    case elevationG = "Elevation G"

    struct GYDropShadowModifier: ViewModifier {
        var shadow: GYDropShadow

        func body(content: Content) -> some View {
            switch shadow {
            case .elevationL4:
                return content
                    .shadow(color: GYUIColors.shadow.elevationL401, radius: GYDropShadow.l401Radius, x: 0, y: GYDropShadow.l401y)
                    .shadow(color: GYUIColors.shadow.elevationL402, radius: GYDropShadow.l402Radius, x: 0, y: GYDropShadow.l402y)
            case .elevationL3:
                return content
                    .shadow(color: GYUIColors.shadow.elevationL301, radius: GYDropShadow.l301Radius, x: 0, y: GYDropShadow.l301y)
                    .shadow(color: GYUIColors.shadow.elevationL302, radius: GYDropShadow.l302Radius, x: 0, y: GYDropShadow.l302y)
            case .elevationL2:
                return content
                    .shadow(color: GYUIColors.shadow.elevationL201, radius: GYDropShadow.l201Radius, x: 0, y: GYDropShadow.l201y)
                    .shadow(color: GYUIColors.shadow.elevationL202, radius: GYDropShadow.l202Radius, x: 0, y: GYDropShadow.l202y)
            case .elevationL1:
                return content
                    .shadow(color: GYUIColors.shadow.elevationL101, radius: GYDropShadow.l101Radius, x: 0, y: GYDropShadow.l101y)
                    .shadow(color: GYUIColors.shadow.elevationL102, radius: GYDropShadow.l102Radius, x: 0, y: GYDropShadow.l102y)
            case .elevationG:
                return content
                    .shadow(color: GYUIColors.shadow.elevationG01, radius: GYDropShadow.G01Radius, x: 0, y: GYDropShadow.G01y)
                    .shadow(color: GYUIColors.shadow.elevationG02, radius: GYDropShadow.G02Radius, x: 0, y: GYDropShadow.G02y)
            }
        }
    }

    // change l401Radius 100 -> 80
    static let l401Radius = adaptiveNumber(light: 80, dark: 80)
    static let l402Radius = adaptiveNumber(light: 32, dark: 32)
    static let l301Radius = adaptiveNumber(light: 32, dark: 32)
    static let l302Radius = adaptiveNumber(light: 3, dark: 3)
    static let l201Radius = adaptiveNumber(light: 24, dark: 24)
    static let l202Radius = adaptiveNumber(light: 1.8, dark: 1.8)
    static let l101Radius = adaptiveNumber(light: 4, dark: 4)
    static let l102Radius = adaptiveNumber(light: 1.8, dark: 1.8)
    static let G01Radius = adaptiveNumber(light: 1.5, dark: 1.5)
    static let G02Radius = adaptiveNumber(light: 3, dark: 3)
    static let B01Radius = adaptiveNumber(light: 1, dark: 1.5)
    static let B02Radius = adaptiveNumber(light: 2, dark: 1.2)

    static let l401y = adaptiveNumber(light: 8, dark: 8)
    static let l402y = adaptiveNumber(light: 4, dark: 4)
    static let l301y = adaptiveNumber(light: 6, dark: 6)
    static let l302y = adaptiveNumber(light: 0, dark: 0)
    static let l201y = adaptiveNumber(light: 2.4, dark: 2.4)
    static let l202y = adaptiveNumber(light: 0, dark: 0)
    static let l101y = adaptiveNumber(light: 1, dark: 1)
    static let l102y = adaptiveNumber(light: 0, dark: 0)
    static let G01y = adaptiveNumber(light: 0, dark: 0)
    static let G02y = adaptiveNumber(light: 0, dark: 0)
    static let B01y = adaptiveNumber(light: 0, dark: 0.5)
    static let B02y = adaptiveNumber(light: 0.5, dark: 0.2)

    static func adaptiveNumber(light: CGFloat, dark: CGFloat) -> CGFloat {
        let colorScheme = UITraitCollection.current.userInterfaceStyle
        switch colorScheme {
        case .light:
            return light
        case .dark:
            return dark
        default:
            return light
        }
    }
}

extension View {
    func GYDropShadows(_ shadow: GYDropShadow) -> some View {
        return modifier(GYDropShadow.GYDropShadowModifier(shadow: shadow))
    }
}
