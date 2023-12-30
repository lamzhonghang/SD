//
//  GetHeightExtension.swift
//  SD
//
//  Created by lan on 2023/11/29.
//

import SwiftUI

struct GetHeightModifier: ViewModifier {
    @Binding var height: CGFloat


    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
    }
}
