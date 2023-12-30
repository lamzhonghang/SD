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
            static let pressed = GYUIColors.label.primary
            static let disable = GYUIColors.label.disable
        }

        enum background {
            static let normal = GYUIColors.fill.surfaceBright
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
            static let pressed = GYUIColors.label.onColor.pressed
            static let disable = GYUIColors.label.onColor.disable
        }

        enum background {
            static let normal = GYUIColors.fill.accent.normal
            static let pressed = GYUIColors.fill.accent.pressed
            static var disable = GYUIColors.fill.accent.disable
        }

        static let progress = GYColors.base.white
    }
}
