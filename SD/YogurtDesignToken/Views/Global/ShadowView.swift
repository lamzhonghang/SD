//
//  ShadowView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/25.
//

import SwiftUI

struct ShadowView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(GYDropShadow.allCases, id: \.self) { shadow in
                    HStack {
                        Text(shadow.rawValue)
                            .modifier(TokenTitle())
                        VStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: GYRadius.s8)
                                .fill(GYUIColors.fill.surfaceBright)
                                .frame(width: GYSpacing.size.size8XL64, height: GYSpacing.size.size8XL64)
                                .GYDropShadows(shadow)
                                .padding(.vertical, GYSpacing.padding.paddingXL20)
                        }
                    }

                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(GYSpacing.margin.marginXL32)
            }
            .navigationTitle("Shadow")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ShadowView()
}
