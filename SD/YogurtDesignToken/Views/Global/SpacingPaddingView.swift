//
//  SpacingPaddingView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/25.
//

import SwiftUI

struct SpacingPaddingView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(GYSpacing.padding.allPadding, id: \.self) { padding in
                    HStack {
                        Text("Padding: \(Int(padding))")
                            .modifier(TokenTitle())
                        HStack(spacing: 0) {
                            Rectangle()
                                .fill(GYUIColors.fill.surface)
                                .frame(width: 50, height: 50)
                            Rectangle()
                                .fill(GYColors.blue.blue200)
                                .frame(width: padding)
                            Rectangle()
                                .fill(GYUIColors.fill.surface)
                                .frame(width: 50, height: 50)
                        }
                    }
                    .padding(GYSpacing.margin.marginXL32)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Padding")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}
