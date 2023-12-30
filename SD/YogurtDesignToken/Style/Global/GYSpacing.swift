//
//  GYSpacing.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import SwiftUI

enum GYSpacing {
    private static let spacingDictionary: SpacingDictionary? = loadSpacingDictionary()

    // Size
    enum size {
        static let sizeNone0 = spacingValue(for: .size, key: "none-0", default: 0)
        static let sizeXS4 = spacingValue(for: .size, key: "xs-4", default: 4)
        static let sizeS8 = spacingValue(for: .size, key: "s-8", default: 8)
        static let sizeM12 = spacingValue(for: .size, key: "m-12", default: 12)
        static let sizeL16 = spacingValue(for: .size, key: "l-16", default: 16)
        static let sizeXL20 = spacingValue(for: .size, key: "xl-20", default: 20)
        static let sizeXXL24 = spacingValue(for: .size, key: "xxl-24", default: 24)
        static let size3XL32 = spacingValue(for: .size, key: "3xl-32", default: 32)
        static let size4XL36 = spacingValue(for: .size, key: "4xl-36", default: 36)
        static let size5XL40 = spacingValue(for: .size, key: "5xl-40", default: 40)
        static let size6XL48 = spacingValue(for: .size, key: "6xl-48", default: 48)
        static let size7XL56 = spacingValue(for: .size, key: "7xl-56", default: 56)
        static let size8XL64 = spacingValue(for: .size, key: "8xl-64", default: 64)
    }

    // Padding
    enum padding {
        static let paddingNone0 = spacingValue(for: .padding, key: "none-0", default: 0)
        static let paddingXS4 = spacingValue(for: .padding, key: "xs-4", default: 4)
        static let paddingS8 = spacingValue(for: .padding, key: "s-8", default: 8)
        static let paddingM12 = spacingValue(for: .padding, key: "m-12", default: 12)
        static let paddingL16 = spacingValue(for: .padding, key: "l-16", default: 16)
        static let paddingXL20 = spacingValue(for: .padding, key: "xl-20", default: 20)
        static let paddingXXL24 = spacingValue(for: .padding, key: "xxl-24", default: 24)
        static let padding3XL32 = spacingValue(for: .padding, key: "3xl-32", default: 32)
        static let padding4XL36 = spacingValue(for: .padding, key: "4xl-36", default: 36)
        static let padding5XL40 = spacingValue(for: .padding, key: "5xl-40", default: 40)
        static let padding6XL48 = spacingValue(for: .padding, key: "6xl-48", default: 48)
    }

    // Margin
    enum margin {
        static let marginNone0 = spacingValue(for: .margin, key: "none-0", default: 0)
        static let marginXXS4 = spacingValue(for: .margin, key: "xxs-4", default: 4)
        static let marginXS8 = spacingValue(for: .margin, key: "xs-8", default: 8)
        static let marginS12 = spacingValue(for: .margin, key: "s-12", default: 12)
        static let marginM16 = spacingValue(for: .margin, key: "m-16", default: 16)
        static let marginL24 = spacingValue(for: .margin, key: "l-24", default: 24)
        static let marginXL32 = spacingValue(for: .margin, key: "xl-32", default: 32)
        static let marginXXL40 = spacingValue(for: .margin, key: "xxl-40", default: 40)
        static let marginXXXL48 = spacingValue(for: .margin, key: "xxxl-48", default: 48)
    }

    private static func spacingValue(for category: SpacingCategory, key: String, default defaultValue: Int) -> CGFloat {
        switch category {
        case .margin:
            return CGFloat(spacingDictionary?.margin[key]?.value ?? defaultValue)
        case .padding:
            return CGFloat(spacingDictionary?.padding[key]?.value ?? defaultValue)
        case .size:
            return CGFloat(spacingDictionary?.size[key]?.value ?? defaultValue)
        }
    }

    private enum SpacingCategory {
        case margin, padding, size
    }
}

extension GYSpacing.margin {
    static let allMargin: [CGFloat] = [
        GYSpacing.margin.marginNone0,
        GYSpacing.margin.marginXXS4,
        GYSpacing.margin.marginXS8,
        GYSpacing.margin.marginS12,
        GYSpacing.margin.marginM16,
        GYSpacing.margin.marginL24,
        GYSpacing.margin.marginXL32,
        GYSpacing.margin.marginXXL40,
        GYSpacing.margin.marginXXXL48
    ]
}

extension GYSpacing.padding {
    static let allPadding: [CGFloat] = [
        GYSpacing.padding.paddingNone0,
        GYSpacing.padding.paddingXS4,
        GYSpacing.padding.paddingS8,
        GYSpacing.padding.paddingM12,
        GYSpacing.padding.paddingL16,
        GYSpacing.padding.paddingXL20,
        GYSpacing.padding.paddingXXL24,
        GYSpacing.padding.padding3XL32,
        GYSpacing.padding.padding4XL36,
        GYSpacing.padding.padding5XL40,
        GYSpacing.padding.padding6XL48
    ]
}

extension GYSpacing.size {
    static let allSizes: [CGFloat] = [
        GYSpacing.size.sizeNone0,
        GYSpacing.size.sizeXS4,
        GYSpacing.size.sizeS8,
        GYSpacing.size.sizeM12,
        GYSpacing.size.sizeL16,
        GYSpacing.size.sizeXL20,
        GYSpacing.size.sizeXXL24,
        GYSpacing.size.size3XL32,
        GYSpacing.size.size4XL36,
        GYSpacing.size.size5XL40,
        GYSpacing.size.size6XL48,
        GYSpacing.size.size7XL56,
        GYSpacing.size.size8XL64
    ]
}
