//
//  TabbedItems.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import Foundation
import NeverMindSymbols
import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case Tab1 = 0
    case Tab2
    case Tab3

    var title: String {
        switch self {
        case .Tab1:
            return "Tab 1"
        case .Tab2:
            return "Tab 2"
        case .Tab3:
            return "Tab 3"
        }
    }

    var icon: Image {
        switch self {
        case .Tab1:
            return NeverMindSymbol.star.image
        case .Tab2:
            return NeverMindSymbol.star.image
        case .Tab3:
            return NeverMindSymbol.star.image
        }
    }
}

enum TabStyle {
    case primary
    case secondary
}

enum TabbarItemStyle {
    case labelOnly
    case iconOnly(Image)
}
