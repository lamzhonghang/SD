//
//  ColorBorderView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/26.
//

import SwiftUI

struct ColorBorderView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Border")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.border.allBorders, id: \.self) { color in
                        ColorBorderCellView(colorInfo: color, bg: GYUIColors.accent)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)
        }
        .navigationTitle("Border")
        .toolbarTitleDisplayMode(.inline)
    }
}

struct ColorBorderCellView: View {
    var colorInfo: ColorInfo
    var bg: Color

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: GYRadius.xs4)
                .fill(GYUIColors.fill.surfaceBright)
                .strokeBorder(colorInfo.color)
                .frame(width: 150, height: 150)
            Text(colorInfo.name)
                .GYTypo(.bodyMedium)
                .foregroundColor(GYUIColors.label.tertiary)
                .padding(GYSpacing.padding.paddingXS4)
        }
    }
}

