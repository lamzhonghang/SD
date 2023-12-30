//
//  ColorBorderView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/26.
//

import SwiftUI

struct ColorDividerView: View {
    var body: some View {
        ScrollView {
            Grid {
                ForEach(GYUIColors.divider.allDividers, id: \.self) { color in
                    GridRow {
                        Text(color.name)
                            .GYTypo(.bodyMedium)
                            .foregroundColor(GYUIColors.label.tertiary)
                            .padding(GYSpacing.padding.paddingXS4)
                            .gridColumnAlignment(.leading)
                        VStack {
                            Divider()
                                .foregroundColor(color.color)
                                .padding()
                        }
                    }
                }
            }
            .padding(GYSpacing.padding.paddingL16)
        }
        .navigationTitle("Divider")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    ColorDividerView()
}
