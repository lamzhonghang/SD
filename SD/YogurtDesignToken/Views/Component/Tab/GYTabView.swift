//
//  GYTab.swift
//  SD
//
//  Created by lan on 2023/12/28.
//

import NeverMindSymbols
import SwiftUI

struct GYTabView: View {
    @State var selectedIndex: Int = 0
    let image = NeverMindSymbol.star.image
    let spacing = GYSpacing.padding.paddingXL20

    var body: some View {
        ScrollView {
            VStack(spacing: GYSpacing.padding.padding3XL32) {
                VStack(spacing: spacing) {
                    Text("Primary")
                        .modifier(TokenTitle())

                    GYTabBarView(tabbarItems: TabbedItems.allCases.map { $0.title }, selectedIndex: $selectedIndex, style: .primary, itemStyle: .iconOnly(image), isScrollable: false)
                    GYTabBarView(tabbarItems: TabbedItems.allCases.map { $0.title }, selectedIndex: $selectedIndex, style: .primary, itemStyle: .labelOnly, isScrollable: false)
                    GYTabBarView(tabbarItems: TabbedItems.allCases.map { $0.title }, selectedIndex: $selectedIndex, style: .primary, itemStyle: .iconOnly(image), isScrollable: true)
                    GYTabBarView(tabbarItems: TabbedItems.allCases.map { $0.title }, selectedIndex: $selectedIndex, style: .primary, itemStyle: .labelOnly, isScrollable: true)
                }
                VStack(spacing: spacing) {
                    Text("Secondary")
                        .modifier(TokenTitle())

                    GYTabBarView(tabbarItems: TabbedItems.allCases.map { $0.title }, selectedIndex: $selectedIndex, style: .secondary, itemStyle: .iconOnly(image), isScrollable: false)
                    GYTabBarView(tabbarItems: TabbedItems.allCases.map { $0.title }, selectedIndex: $selectedIndex, style: .secondary, itemStyle: .labelOnly, isScrollable: false)
                    GYTabBarView(tabbarItems: TabbedItems.allCases.map { $0.title }, selectedIndex: $selectedIndex, style: .secondary, itemStyle: .iconOnly(image), isScrollable: true)
                    GYTabBarView(tabbarItems: TabbedItems.allCases.map { $0.title }, selectedIndex: $selectedIndex, style: .secondary, itemStyle: .labelOnly, isScrollable: true)
                }

//                TabView(selection: $selectedIndex) {
//                    Text("1")
//                        .tag(0)
//                    Text("2")
//                        .tag(1)
//                    Text("3")
//                        .tag(2)
//                }
            }
            .padding()
            .frame(maxWidth: 500)
        }
        .navigationTitle("Tab")
        .navigationBarTitleDisplayMode(.inline)
    }
}
