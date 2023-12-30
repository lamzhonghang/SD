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
                            .imageScale(.small)
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
