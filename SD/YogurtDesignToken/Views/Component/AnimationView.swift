//
//  AnimationView.swift
//  SD
//
//  Created by lan on 2023/12/29.
//

import NeverMindSymbols
import SwiftUI

struct AnimationView: View {
    @State private var animation1 = false
    @State var selectedDurationIndex: Int = 0
    @State private var selectedStyleIndex: Int = 0
    let spacing = GYSpacing.padding.paddingXL20

    let durationStrings: [String] = GYAnimation.Duration.allCases.map {
        String(format: "%.0f ms", $0.rawValue * 1000)
    }

    let animationStyleIdentifiers: [String] = GYAnimation.Expressive.allCases.map { $0.identifier }

    var body: some View {
        ScrollView {
            VStack(spacing: spacing) {
                Text("Expressive")
                    .modifier(TokenTitle())
                GYTabBarView(tabbarItems: durationStrings, selectedIndex: $selectedDurationIndex, style: .secondary, itemStyle: .labelOnly, isScrollable: true)
                GYTabBarView(tabbarItems: animationStyleIdentifiers, selectedIndex: $selectedStyleIndex, style: .secondary, itemStyle: .labelOnly, isScrollable: true)
                VStack(spacing: spacing) {
                    Button {
                        animation1.toggle()
                    } label: {
                        HStack {
                            NeverMindSymbol.playFill.image
                            Text("Start")
                        }
                    }
                    .buttonStyle(.GYPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(spacing: spacing) {
                        HStack {
                            Circle()
                                .fill(GYColors.blue.blue500)
                                .frame(width: GYSpacing.size.size3XL32)
                                .animation(selectedAnimation, value: animation1)
                        }
                        .frame(maxWidth: .infinity, alignment: animation1 ? .trailing : .leading)
                        HStack {
                            Circle()
                                .fill(GYColors.blue.blue500)
                                .frame(width: GYSpacing.size.size8XL64)
                                .animation(selectedAnimation, value: animation1)
                        }
                        .frame(maxWidth: .infinity, alignment: animation1 ? .trailing : .leading)
                    }
                    .frame(maxWidth: 400)
                }
            }
            .padding(GYSpacing.padding.paddingXL20)
        }
        .navigationTitle("Animation")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var selectedAnimation: Animation {
        let selectedDuration = GYAnimation.Duration.allCases[selectedDurationIndex]
        let selectedStyle = GYAnimation.Expressive.allCases[selectedStyleIndex]
        return selectedStyle.animation(for: selectedDuration)
    }
}

extension GYAnimation.Expressive {
    func animation(for duration: GYAnimation.Duration) -> Animation {
        switch self {
        case .standard:
            return GYAnimation.expressive(for: .standard(duration))
        case .entrance:
            return GYAnimation.expressive(for: .entrance(duration))
        case .exit:
            return GYAnimation.expressive(for: .exit(duration))
        case .spring:
            return GYAnimation.expressive(for: .spring(duration))
        }
    }
}

extension GYAnimation.Dramatic {
    func animation(for duration: GYAnimation.Duration) -> Animation {
        switch self {
        case .standard:
            return GYAnimation.expressive(for: .standard(duration))
        case .entrance:
            return GYAnimation.expressive(for: .entrance(duration))
        case .exit:
            return GYAnimation.expressive(for: .exit(duration))
        case .spring:
            return GYAnimation.expressive(for: .spring(duration))
        }
    }
}
