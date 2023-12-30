//
//  ColorMatrixView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/22.
//

import SwiftUI

struct ColorsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Base")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                    ForEach(GYColors.base.allBaseColors, id: \.self) { color in
                        VStack {
                            RoundedRectangle(cornerRadius: GYRadius.s8)
                                .fill(color.color)
                                .frame(width: 150, height: 150)
                                .overlay {
                                    RoundedRectangle(cornerRadius: GYRadius.s8)
                                        .stroke(GYUIColors.border.translusent)
                                }
                            Text(color.name)
                                .GYTypo(.bodyMedium)
                                .foregroundColor(GYUIColors.label.tertiary)
                                .padding(GYSpacing.padding.paddingXS4)
                        }
                    }
                }
            }
            .padding(.horizontal, GYSpacing.padding.paddingL16)
        }
        .navigationTitle("Color")
        .toolbarTitleDisplayMode(.inline)
    }
}
