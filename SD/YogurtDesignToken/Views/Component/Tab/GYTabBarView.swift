//
//  TabView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/25.
//

import NeverMindSymbols
import SwiftUI

struct GYTabBarView: View {
    var tabbarItems: [String]
    @Namespace private var ItemTransition
    @Binding var selectedIndex: Int
    var style: TabStyle
    var itemStyle: TabbarItemStyle
    var isScrollable: Bool
    let tabHorizontalPadding = GYSpacing.padding.paddingXL20

    var body: some View {
        Group {
            if isScrollable {
                scrollViewContent
            } else {
                nonScrollViewContent
            }
        }
    }

    private var scrollViewContent: some View {
        ScrollViewReader { _ in
            ScrollView(.horizontal, showsIndicators: false) {
                tabBarItemsStack
            }
        }
    }

    private var nonScrollViewContent: some View {
        tabBarItemsStack
    }

    private var tabBarItemsStack: some View {
        HStack(spacing: tabHorizontalPadding) {
            ForEach(self.tabbarItems.indices, id: \.self) { index in
                Button {
                    withAnimation(.easeInOut) {
                        self.selectedIndex = index
                    }
                } label: {
                    GYTabBarItemView(name: tabbarItems[index], isActive: selectedIndex == index, namespace: ItemTransition, style: style, itemStyle: itemStyle)
                }
                .buttonStyle(TabItemActiveButtonStyle())
            }
        }
    }
}
