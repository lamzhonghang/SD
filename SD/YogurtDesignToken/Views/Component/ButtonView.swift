//
//  ButtonView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/22.
//

import NeverMindSymbols
import SwiftUI

struct ButtonView: View {
    let icon: Image = NeverMindSymbol.xmindLogo.image
    @State private var isLoading = false

    var body: some View {
        ScrollView {
            VStack(spacing: GYSpacing.padding.paddingL16) {
                VStack {
                    Text("Primary")
                        .modifier(TokenTitle())

                    VStack {
                        Button("Button", action: {})
                            .buttonStyle(GYButtonStyle(type: .iconLeft(icon)))

                        Button("Button", action: {})
                            .buttonStyle(GYButtonStyle(type: .iconRight(icon)))

                        Button("Button", action: { isLoading.toggle() })
                            .buttonStyle(GYButtonStyle(isLoading: isLoading))

                        Button("Button", action: {})
                            .disabled(true)
                    }
                }
                .buttonStyle(.GYPrimary)
                .imageScale(.small)

                VStack {
                    Text("Default")
                        .modifier(TokenTitle())

                    Button("Button", action: {})
                        .buttonStyle(GYButtonStyle(type: .iconLeft(icon), styleType: .default))

                    Button("Button", action: {})
                        .buttonStyle(GYButtonStyle(type: .iconRight(icon), styleType: .default))

                    Button("Button", action: { isLoading.toggle() })
                        .buttonStyle(GYButtonStyle(styleType: .default, isLoading: isLoading))

                    Button("Button", action: {})
                        .buttonStyle(GYButtonStyle(styleType: .default))
                        .disabled(true)
                }
                .imageScale(.small)
                .buttonStyle(.GYDefault)

                VStack {
                    Text("Plain with padding")
                        .modifier(TokenTitle())

                    // label only
                    HStack {
                        Spacer()
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .accent, isPadding: true))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .blue, isPadding: true))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .default, isPadding: true))
                        Spacer()
                    }

                    // Icon only
                    HStack {
                        Spacer()
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .accent, isPadding: true))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .blue, isPadding: true))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .default, isPadding: true))
                        Spacer()
                    }

                    // Lable Only Disable
                    HStack {
                        Spacer()
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .accent, isPadding: true))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .blue, isPadding: true))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .default, isPadding: true))
                        Spacer()
                    }
                    .disabled(true)

                    // Icon only disable
                    HStack {
                        Spacer()
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .accent, isPadding: true))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .blue, isPadding: true))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .default, isPadding: true))
                        Spacer()
                    }
                    .disabled(true)
                }

                VStack {
                    Text("Plain without padding")
                        .modifier(TokenTitle())

                    // Label only
                    HStack {
                        Spacer()
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .accent, isPadding: false))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .blue, isPadding: false))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .default, isPadding: false))
                        Spacer()
                    }

                    // Icon only
                    HStack {
                        Spacer()
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .accent, isPadding: false))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .blue, isPadding: false))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .default, isPadding: false))
                        Spacer()
                    }

                    // Label only disable
                    HStack {
                        Spacer()
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .accent, isPadding: false))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .blue, isPadding: false))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .labelOnly, styleType: .default, isPadding: false))
                        Spacer()
                    }
                    .disabled(true)

                    // Icon only disable
                    HStack {
                        Spacer()
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .accent, isPadding: false))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .blue, isPadding: false))
                        Button("Button", action: {})
                            .buttonStyle(GYButtonLinkStyle(type: .iconOnly(icon), styleType: .default, isPadding: false))
                        Spacer()
                    }
                    .disabled(true)
                }
            }
            .padding()
        }
        .navigationTitle("Button")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    ButtonView()
}
