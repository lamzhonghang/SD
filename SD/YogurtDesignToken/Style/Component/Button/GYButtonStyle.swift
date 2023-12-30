//
//  GYButtonStyle.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/21.
//

import SwiftUI

struct GYButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    var type: ButtonType = .textOnly
    var styleType: StyleType = .default
    var isLoading: Bool = false

    enum ButtonType {
        case textOnly
        case iconLeft(Image)
        case iconRight(Image)
    }

    enum StyleType {
        case primary
        case `default`
    }

    init(type: ButtonType = .textOnly, styleType: StyleType = .primary, isLoading: Bool = false) {
        self.type = type
        self.styleType = styleType
        self.isLoading = isLoading
    }

    func makeBody(configuration: Configuration) -> some View {
        let colors = stateColors(for: configuration)

        HStack(spacing: 8) {
            if isLoading {
                ProgressView()
                    .tint(progressColors())
            } else {
                ButtonContent(configuration: configuration)
            }
        }
        .padding(.vertical, GYButton.verticalPadding)
        .padding(.horizontal, GYButton.horizontalPadding)
        .frame(maxWidth: .infinity)
        .frame(minHeight: GYButton.minHeight)
        .frame(maxWidth: 380)
        .foregroundColor(colors.foregroundColor)
        .background(colors.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: GYButton.radius, style: .continuous))
    }

    @ViewBuilder
    private func ButtonContent(configuration: Configuration) -> some View {
        if case let .iconLeft(image) = type {
            image
        }
        configuration.label
            .GYTypo(GYButton.typo)
            .dynamicTypeSize(DynamicTypeSize.medium ... DynamicTypeSize.xLarge)

        if case let .iconRight(image) = type {
            image
        }
    }

    private func stateColors(for configuration: Configuration) -> (foregroundColor: Color, backgroundColor: Color) {
        switch styleType {
        case .default:
            return defaultColorsState(for: configuration)
        case .primary:
            return pimaryColorsState(for: configuration)
        }
    }

    private func progressColors() -> Color {
        switch styleType {
        case .primary:
            return GYButton.primary.progress
        case .default:
            return GYButton.default.progress
        }
    }

    private func defaultColorsState(for configuration: Configuration) -> (foregroundColor: Color, backgroundColor: Color) {
        if configuration.isPressed || isLoading {
            return (GYButton.default.label.pressed, GYButton.default.background.pressed)
        } else if !isEnabled {
            return (GYButton.default.label.disable, GYButton.default.background.disable)
        } else {
            return (GYButton.default.label.normal, GYButton.default.background.normal)
        }
    }

    private func pimaryColorsState(for configuration: Configuration) -> (foregroundColor: Color, backgroundColor: Color) {
        if configuration.isPressed || isLoading {
            return (GYButton.primary.label.pressed, GYButton.primary.background.pressed)
        } else if !isEnabled {
            return (GYButton.primary.label.disable, GYButton.primary.background.disable)
        } else {
            return (GYButton.primary.label.normal, GYButton.primary.background.normal)
        }
    }
}

// struct LoadingStyle: PrimitiveButtonStyle {
//    @Binding var isLoading: Bool
//
//    func makeBody(configuration: Configuration) -> some View {
//        Button(configuration)
//            .buttonStyle(GYButtonStyle(isLoading: isLoading))
//            .allowsHitTesting(false)
//            .contentShape(Rectangle())
//    }
// }

extension ButtonStyle where Self == GYButtonStyle {
    static var GYDefault: GYButtonStyle { .init(styleType: .default) }
    static var GYPrimary: GYButtonStyle { .init(styleType: .primary) }
}
