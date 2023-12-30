//
//  ColorMaskView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/26.
//

import SwiftUI

struct ColorMaskView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: GYSpacing.padding.paddingM12) {
                Text("Mask")
                    .modifier(TokenTitle())
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: GYSpacing.padding.paddingL16)], spacing: GYSpacing.padding.paddingXL20, content: {
                    ForEach(GYUIColors.mask.allMasks, id: \.self) { color in
                        ColorFillCellView(colorInfo: color, bg: GYUIColors.fill.surfaceBright)
                    }
                })
            }
            .padding(GYSpacing.margin.marginM16)
        }
        .navigationTitle("Mask")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    ColorMaskView()
}
