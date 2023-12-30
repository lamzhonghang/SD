//
//  GYTabStyle.swift
//  SD
//
//  Created by lan on 2023/12/28.
//

import SwiftUI

struct TabItemActiveButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? GYTab.primary.active.pressed : GYTab.primary.active.normal)
            .foregroundColor(isEnabled ? GYTab.primary.active.disable : GYTab.primary.active.normal)
    }
}

struct TabItemActiveStyleModifier: ViewModifier {
    var style: TabStyle
    let namespace: Namespace.ID
    let id: String = "activeItem"

    func body(content: Content) -> some View {
        switch style {
        case .primary:
            return AnyView(
                content
                    .GYTypo(.subheadMini)
                    .padding(.vertical, GYTab.primary.verticalPadding)
                    .foregroundColor(GYTab.primary.active.normal)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .bottom) {
                        Capsule()
                            .frame(height: GYTab.primary.lineWidth)
                            .foregroundColor(GYTab.primary.line)
                            .matchedGeometryEffect(id: id, in: namespace)
                    }
            )
            .hoverEffect(.highlight)
        case .secondary:
            return AnyView(
                content
                    .GYTypo(.subheadMini)
                    .foregroundColor(GYTab.primary.active.normal)
                    .padding(.horizontal, GYSpacing.padding.paddingS8)
                    .padding(.vertical, GYSpacing.padding.paddingS8)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: GYTab.radius, style: .continuous)
                            .fill(GYTab.secondary.fill)
                            .matchedGeometryEffect(id: id, in: namespace)
                    }
            )
            .hoverEffect(.highlight)
        }
    }
}

struct TabItemInactiveStyleModifier: ViewModifier {
    var style: TabStyle

    func body(content: Content) -> some View {
        switch style {
        case .primary:
            return AnyView(
                content
                    .GYTypo(.bodyMedium)
                    .padding(.vertical, GYTab.primary.verticalPadding)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(GYTab.primary.inactive.normal)
                    .hoverEffect(.highlight)
            )

        case .secondary:
            return AnyView(
                content
                    .GYTypo(.bodyMedium)
                    .padding(.horizontal, GYSpacing.padding.paddingS8)
                    .padding(.vertical, GYSpacing.padding.paddingXS4)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(GYTab.primary.inactive.normal)
                    .hoverEffect(.highlight)
            )
        }
    }
}
