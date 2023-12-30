//
//  SizeView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/25.
//

import SwiftUI

struct SpacingSizeView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(GYSpacing.size.allSizes, id: \.self) { size in
                    HStack {
                        Text("Size: \(Int(size))")
                            .modifier(TokenTitle())

                        HStack(spacing: 0) {
                            Rectangle()
                                .fill(GYColors.pink.pink300)
                                .frame(width: size, height: size)
                        }
                    }
                    .padding(GYSpacing.margin.marginXL32)
                }
            }

            .frame(maxWidth: .infinity)
            .navigationTitle("Size")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SpacingSizeView()
}
