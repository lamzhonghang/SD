//
//  GYButton.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/20.
//

import SwiftUI

enum GYButton {
    static let radius = GYRadius.s8
    static let typo = GYTypography.subheadSmall
    static let horizontalPadding = GYSpacing.padding.paddingL16
    static let verticalPadding = GYSpacing.padding.paddingS8
    static let minHeight = GYSpacing.size.size6XL48

    enum `default` {
        enum label {
            static let normal = GYUIColors.label.primary
            static let hover = GYUIColors.label.secondary
            static let pressed = GYUIColors.label.primary
            static let disable = GYUIColors.label.quaternary
        }

        enum background {
            static let normal = GYUIColors.fill.surfaceBright
            static var hover: Color {
                return Color(light: GYUIColors.fill.surfaceBright, dark: GYUIColors.mask.overlayS)
            }

            static let pressed = GYUIColors.mask.overlayDeep
            static var disable: Color {
                return Color(light: GYUIColors.mask.invert, dark: GYUIColors.fill.surfaceBright)
            }
        }

        static let progress = GYColors.base.gray
    }

    enum primary {
        enum label {
            static let normal = GYUIColors.label.onColor.normal
            static let hover = GYUIColors.label.onColor.hover
            static let pressed = GYUIColors.label.onColor.pressed
            static let disable = GYUIColors.label.onColor.disable
        }

        enum background {
            static let normal = GYUIColors.fill.accent.normal
            static let hover = GYUIColors.fill.accent.hover
            static let pressed = GYUIColors.fill.accent.pressed
            static var disable = GYUIColors.fill.accent.disable
        }

        static let progress = GYColors.base.white
    }

    enum plain {
        static let minHeight = GYSpacing.size.size3XL32
        static let horizontalPadding = GYSpacing.padding.paddingL16
        static let verticalPadding = GYSpacing.padding.paddingXS4

        static let compactMinHeight = GYSpacing.size.sizeXXL24

        enum label {
            enum accent {
                static let normal = GYUIColors.label.accent.normal
                static let hover = GYUIColors.label.accent.hover
                static let pressed = GYUIColors.label.accent.pressed
                static let disable = GYUIColors.label.accent.disable
            }

            enum blue {
                static let normal = GYUIColors.label.blue.normal
                static let hover = GYUIColors.label.blue.hover
                static let pressed = GYUIColors.label.blue.pressed
                static let disable = GYUIColors.label.blue.disable
            }
            
            enum `default` {
                static let normal = GYUIColors.label.primary
                static let hover = GYUIColors.label.secondary
                static let pressed = GYUIColors.label.primary
                static let disable = GYUIColors.label.quaternary
            }
        }

        enum background {
            static let normal = GYUIColors.fill.transparent
            static let hover = GYUIColors.mask.overlayS
            static let pressed = GYUIColors.mask.overlayDeep
            static let disable = GYUIColors.fill.transparent
        }
    }
}
