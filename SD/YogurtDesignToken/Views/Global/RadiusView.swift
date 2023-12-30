//
//  ShadowView.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/24.
//

import SwiftUI

struct RadiusView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(GYRadius.allRadius, id: \.self) { radius in
                    HStack {
                        Text("Radius: \(Int(radius))")
                            .modifier(TokenTitle())
                        UnevenRoundedRectangle(topTrailingRadius: radius)
                            .fill(GYColors.cyan.cyan400)
                            .frame(width: radius * 2, height: radius * 2)
                            .padding()
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Radius")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RadiusView()
}
