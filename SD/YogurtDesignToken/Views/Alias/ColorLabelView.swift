//
//  GYUIColorView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/26.
//

import SwiftUI

struct ColorLabelView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Label")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.label.label, id: \.self) { color in
                        ColorLabelCellView(colorInfo: color, bg: GYUIColors.fill.surfaceBright)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)

            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Label on Color")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.label.labelonColor, id: \.self) { color in
                        ColorLabelCellView(colorInfo: color, bg: GYUIColors.accent)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)

            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Label on Color")
                    .modifier(TokenTitle())
                HStack {
                    ForEach(GYUIColors.label.Inverts, id: \.self) { color in
                        ColorLabelCellView(colorInfo: color, bg: GYColors.base.black)
                    }
                    Spacer()
                }
            }
            .padding(GYSpacing.margin.marginM16)
        }
        .navigationTitle("Label")
        .toolbarTitleDisplayMode(.inline)
    }
}

struct ColorLabelCellView: View {
    var colorInfo: ColorInfo
    var bg: Color

    var body: some View {
        VStack {
            Text("Abc")
                .bold()
                .GYTypo(.headlineMedium)
                .foregroundColor(colorInfo.color)
                .frame(width: 150, height: 150)
                .background {
                    RoundedRectangle(cornerRadius: GYRadius.xs4)
                        .fill(bg)
                        .strokeBorder(GYUIColors.border.translusent)
                }
            Text(colorInfo.name)
                .GYTypo(.bodyMedium)
                .foregroundColor(GYUIColors.label.tertiary)
                .padding(GYSpacing.padding.paddingXS4)
        }
    }
}
