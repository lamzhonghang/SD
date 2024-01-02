//
//  GYButtonStyle.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/21.
//

import SwiftUI

// Button Fill
struct GYButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isHovered = false

    var type: ButtonType = .labelOnly
    var styleType: StyleType = .default
    var isLoading: Bool = false

    enum ButtonType {
        case labelOnly
        case iconLeft(Image)
        case iconRight(Image)
    }

    enum StyleType {
        case primary
        case `default`
    }

    init(type: ButtonType = .labelOnly, styleType: StyleType = .primary, isLoading: Bool = false) {
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
        .onHover { isHovered in
            self.isHovered = isHovered
        }
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
        } else if isHovered {
            return (GYButton.default.label.hover, GYButton.default.background.hover)
        } else {
            return (GYButton.default.label.normal, GYButton.default.background.normal)
        }
    }

    private func pimaryColorsState(for configuration: Configuration) -> (foregroundColor: Color, backgroundColor: Color) {
        if configuration.isPressed || isLoading {
            return (GYButton.primary.label.pressed, GYButton.primary.background.pressed)
        } else if !isEnabled {
            return (GYButton.primary.label.disable, GYButton.primary.background.disable)
        } else if isHovered {
            return (GYButton.primary.label.hover, GYButton.primary.background.hover)
        } else {
            return (GYButton.primary.label.normal, GYButton.primary.background.normal)
        }
    }
}

extension ButtonStyle where Self == GYButtonStyle {
    static var GYDefault: GYButtonStyle { .init(styleType: .default) }
    static var GYPrimary: GYButtonStyle { .init(styleType: .primary) }
}

// Button Link
struct GYButtonLinkStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isHovered = false

    var type: ButtonType = .labelOnly
    var styleType: StyleType = .default
    var isPadding: Bool = false

    enum ButtonType {
        case labelOnly
        case iconOnly(Image)
    }

    enum StyleType {
        case accent
        case blue
        case `default`
    }

    init(type: ButtonType = .labelOnly, styleType: StyleType = .accent, isPadding: Bool = false) {
        self.type = type
        self.styleType = styleType
        self.isPadding = isPadding
    }

    func makeBody(configuration: Configuration) -> some View {
        let colors = stateColors(for: configuration)
        ZStack {
            if case let .iconOnly(image) = type {
                image
            } else {
                configuration.label
            }
        }
        .GYTypo(GYButton.typo)
        .dynamicTypeSize(DynamicTypeSize.medium ... DynamicTypeSize.xLarge)
        .foregroundColor(colors.foregroundColor)
        .if(isPadding) {
            $0.padding(.horizontal, GYButton.plain.horizontalPadding)
                .padding(.vertical, GYButton.plain.verticalPadding)
                .background(colors.backgroundColor)
        }
        .frame(minHeight: isPadding ? GYButton.plain.minHeight : GYButton.plain.compactMinHeight)
        .cornerRadius(GYButton.radius)
        .onHover { isHovered in
            self.isHovered = isHovered
        }
    }

    private func stateColors(for configuration: Configuration) -> (foregroundColor: Color, backgroundColor: Color) {
        switch styleType {
        case .accent:
            return accentColorsState(for: configuration)
        case .blue:
            return blueColorsState(for: configuration)
        case .default:
            return defaultColorsState(for: configuration)
        }
    }

    private func accentColorsState(for configuration: Configuration) -> (foregroundColor: Color, backgroundColor: Color) {
        if configuration.isPressed {
            return (GYButton.plain.label.accent.pressed, GYButton.plain.background.pressed)
        } else if !isEnabled {
            return (GYButton.plain.label.accent.disable, GYButton.plain.background.disable)
        } else if isHovered {
            return (GYButton.plain.label.accent.hover, GYButton.plain.background.hover)
        } else {
            return (GYButton.plain.label.accent.normal, GYButton.plain.background.normal)
        }
    }

    private func blueColorsState(for configuration: Configuration) -> (foregroundColor: Color, backgroundColor: Color) {
        if configuration.isPressed {
            return (GYButton.plain.label.blue.pressed, GYButton.plain.background.pressed)
        } else if !isEnabled {
            return (GYButton.plain.label.blue.disable, GYButton.plain.background.disable)
        } else if isHovered {
            return (GYButton.plain.label.blue.hover, GYButton.plain.background.hover)
        } else {
            return (GYButton.plain.label.blue.normal, GYButton.plain.background.normal)
        }
    }

    private func defaultColorsState(for configuration: Configuration) -> (foregroundColor: Color, backgroundColor: Color) {
        if configuration.isPressed {
            return (GYButton.plain.label.default.pressed, GYButton.plain.background.pressed)
        } else if !isEnabled {
            return (GYButton.plain.label.default.disable, GYButton.plain.background.disable)
        } else if isHovered {
            return (GYButton.plain.label.default.hover, GYButton.plain.background.hover)
        } else {
            return (GYButton.plain.label.default.normal, GYButton.plain.background.normal)
        }
    }
}
