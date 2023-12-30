//
//  ContentView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import SwiftUI

struct TokenContentView: View {
    @State private var selectedItem: ItemType?
    @ObservedObject var dm = designModel()

    var body: some View {
        NavigationSplitView {
            List(selection: self.$selectedItem) {
                Section(header: Text("Global")) {
                    ForEach([ItemType.Color, .Radius, .Typography, .Shdaow, .Size, .Padding, .Margin, .Symbol], id: \.self) { item in
                        self.listItem(item)
                    }
                }

                Section(header: Text("Alias")) {
                    ForEach([ItemType.ColorLabel, .ColorFill, .ColorBorder, .ColorDivider, .ColorMask], id: \.self) { item in
                        self.listItem(item)
                    }
                }

                Section(header: Text("Component")) {
                    ForEach([ItemType.Button, .Tab, .Animation], id: \.self) { item in
                        self.listItem(item)
                    }
                }
            }
            .listStyle(.sidebar)
            .tint(GYUIColors.accent)
            .preferredColorScheme(self.dm.isDarkMode ? .dark : .light)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.dm.isDarkMode.toggle()
                    } label: {
                        Image(systemName: self.dm.isDarkMode ? "moon" : "sun.max")
                    }
                }
            }
        } detail: {
            if let selectedItem = selectedItem {
                TokenDetailView(selectedItem: selectedItem)
            } else {
                Text("Select an Item")
            }
        }
        .navigationDestination(for: ItemType.self) { itemType in
            TokenDetailView(selectedItem: itemType)
        }
    }

    @ViewBuilder
    private func listItem(_ item: ItemType) -> some View {
        NavigationLink(value: item) {
            HStack {
                Text(item.rawValue)
                    .GYTypo(.bodyLarge)
            }
            .padding(.horizontal, GYSpacing.margin.marginXS8)
            .listRowSeparator(.hidden)
        }
    }
}

enum ItemType: String, CaseIterable, Identifiable {
    case Button
    case Color
    case ColorLabel
    case ColorFill
    case ColorBorder
    case ColorDivider
    case ColorMask
    case Radius
    case Typography
    case Shdaow
    case Size
    case Padding
    case Margin
    case Symbol
    case Tab
    case Animation

    var id: String { self.rawValue }
}

struct TokenDetailView: View {
    let selectedItem: ItemType

    var body: some View {
        switch self.selectedItem {
        case .Animation:
            AnimationView()
        case .Tab:
            GYTabView()
        case .Color:
            ColorsView()
        case .ColorLabel:
            ColorLabelView()
        case .ColorFill:
            ColorFillView()
        case .ColorBorder:
            ColorBorderView()
        case .ColorMask:
            ColorMaskView()
        case .ColorDivider:
            ColorDividerView()
        case .Button:
            ButtonView()
        case .Radius:
            RadiusView()
        case .Typography:
            TypographyView()
        case .Shdaow:
            ShadowView()
        case .Size:
            SpacingSizeView()
        case .Padding:
            SpacingPaddingView()
        case .Margin:
            SpacingMarginView()
        case .Symbol:
            SymbolView()
        }
    }
}

struct TokenTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(GYUIColors.label.primary)
            .fontWeight(.regular)
            .GYTypo(.subheadMini)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
