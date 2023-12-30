//
//  GYTab.swift
//  SD
//
//  Created by lan on 2023/12/28.
//

import SwiftUI

enum GYTab {
    static let radius = GYRadius.xs4
    static let typo = GYTypography.subheadMini
    static let iconHorizontalPadding = GYSpacing.padding.paddingXS4

    enum primary {
        static let minHeight = GYSpacing.size.size5XL40
        static let line = GYUIColors.border.primary
        static let lineWidth: CGFloat = 2.0
        static let horizontalPadding = GYSpacing.padding.paddingNone0
        static let verticalPadding = GYSpacing.padding.paddingS8

        enum active {
            static let normal = GYUIColors.label.primary
            static let pressed = GYUIColors.label.secondary
            static let disable = GYUIColors.label.disable
        }

        enum inactive {
            static let normal = GYUIColors.label.secondary
            static let pressed = GYUIColors.label.primary
            static let disable = GYUIColors.label.disable
        }
    }

    enum secondary {
        static let minHeight = GYSpacing.size.size3XL32
        static let fill = GYUIColors.mask.overlayM
        static let horizontalPadding = GYSpacing.padding.paddingS8
        static let verticalPadding = GYSpacing.padding.paddingXS4
        static let verticalMargin = GYSpacing.padding.paddingXS4

        enum active {
            static let normal = GYUIColors.label.primary
            static let pressed = GYUIColors.label.secondary
            static let disable = GYUIColors.label.disable
        }

        enum inactive {
            static let normal = GYUIColors.label.secondary
            static let pressed = GYUIColors.label.primary
            static let disable = GYUIColors.label.disable
        }
    }
}
