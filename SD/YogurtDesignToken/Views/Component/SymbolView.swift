//
//  SymbolView.swift
//  SD
//
//  Created by lan on 2023/12/27.
//

import NeverMindSymbols
import SwiftUI

struct SymbolView: View {
    let categories = NeverMindSymbol.allCases

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(categories, id: \.self) { symbol in
                    VStack(content: {
                        symbol.image
                            .frame(width: 100, height: 100)
                        Text(symbol.rawValue)
                            .foregroundStyle(GYUIColors.label.primary)
                            .GYTypo(.caption)
                        Spacer()
                    })
                }
            }
            .padding(GYSpacing.padding.paddingXL20)
        }
        .navigationTitle("Symbol")
        .navigationBarTitleDisplayMode(.inline)
    }
}
