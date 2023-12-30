//
//  GYTabBarItemView.swift
//  SD
//
//  Created by lan on 2023/12/28.
//

import SwiftUI

struct GYTabBarItemView: View {
    var name: String
    var isActive: Bool = false
    let namespace: Namespace.ID
    var style: TabStyle
    var itemStyle: TabbarItemStyle

    var body: some View {
        if isActive {
            activeTabView
        } else {
            inactiveTabView
        }
    }

    @ViewBuilder private var activeTabView: some View {
        Group {
            switch itemStyle {
            case .labelOnly:
                Text(name)
            case .iconOnly(let image):
                image
                    .padding(.horizontal, GYTab.iconHorizontalPadding)
            }
        }
        .modifier(TabItemActiveStyleModifier(style: style, namespace: namespace))
    }

    @ViewBuilder private var inactiveTabView: some View {
        Group {
            switch itemStyle {
            case .labelOnly:
                Text(name)
            case .iconOnly(let image):
                image
                    .padding(.horizontal, GYTab.iconHorizontalPadding)
            }
        }
        .modifier(TabItemInactiveStyleModifier(style: style))
    }
}
