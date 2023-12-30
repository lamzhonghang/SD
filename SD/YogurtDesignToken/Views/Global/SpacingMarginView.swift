//
//  SpacingMarginView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/25.
//

import SwiftUI

struct SpacingMarginView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(GYSpacing.margin.allMargin, id: \.self) { margin in
                    HStack {
                        Text("Margin: \(Int(margin))")
                            .modifier(TokenTitle())
                        ZStack {
                            Rectangle()
                                .fill(GYColors.orange.orange200)
                                .frame(width: 50 + margin * 2, height: 50 + margin * 2)
                            Rectangle()
                                .fill(GYColors.gray.gray100)
                                .frame(width: 50, height: 50)
                        }
                    }
                    .padding(GYSpacing.margin.marginXL32)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Margin")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SpacingMarginView()
}
