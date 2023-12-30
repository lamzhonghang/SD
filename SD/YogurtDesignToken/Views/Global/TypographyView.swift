//
//  TypographyView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/25.
//

import SwiftUI

struct TypographyView: View {
    let text = "Design is about discovering that form and embodying it."

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: GYSpacing.padding.padding3XL32) {
                ForEach(GYTypography.allCases, id: \.self) { typo in
                    VStack(alignment: .leading) {
                        VStack(spacing: GYSpacing.padding.paddingS8) {
                            Text("\(typo.rawValue) is typography")
                                .bold()
                                .GYTypo(typo)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(text)
                                .GYTypo(.caption)
                                .foregroundStyle(GYUIColors.label.quaternary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding()
            .navigationTitle("Typography")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}
