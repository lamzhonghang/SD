//
//  ColorFillView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/26.
//

import SwiftUI

struct ColorFillView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Fill Accent")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.fill.accentColors, id: \.self) { color in
                        ColorFillCellView(colorInfo: color, bg: GYUIColors.fill.surfaceBright)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)

            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Fill Secondary")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.fill.secondaryColors, id: \.self) { color in
                        ColorFillCellView(colorInfo: color, bg: GYUIColors.fill.surfaceBright)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)

            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Fill Container")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.fill.containerColors, id: \.self) { color in
                        ColorFillCellView(colorInfo: color, bg: GYUIColors.fill.surfaceBright)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)

            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Fill Surface")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.fill.surfaceColors, id: \.self) { color in
                        ColorFillCellView(colorInfo: color, bg: GYUIColors.fill.surfaceBright)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)

            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Fill Transparent")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.fill.transparentColor, id: \.self) { color in
                        ColorFillCellView(colorInfo: color, bg: GYUIColors.fill.surfaceBright)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)
        }
        .navigationTitle("Fill")
        .toolbarTitleDisplayMode(.inline)
    }
}

struct ColorFillCellView: View {
    var colorInfo: ColorInfo
    var bg: Color

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: GYRadius.xs4)
                .fill(colorInfo.color)
                .strokeBorder(GYUIColors.border.translusent)
                .frame(width: 150, height: 150)
            Text(colorInfo.name)
                .GYTypo(.bodyMedium)
                .foregroundColor(GYUIColors.label.tertiary)
                .padding(GYSpacing.padding.paddingXS4)
        }
    }
}
