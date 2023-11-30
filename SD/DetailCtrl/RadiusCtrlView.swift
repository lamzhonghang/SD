//
//  RadiusCtrlView.swift
//  SD
//
//  Created by lan on 2023/11/29.
//

import SwiftUI

struct RadiusCtrlView: View {
    @ObservedObject var dm = designModel()
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }()

    var body: some View {
        HStack {
            Text("Radius")
            Slider(
                value: $dm.topicRadius,
                in: 0 ... 20,
                onEditingChanged: { editing in
                    dm.isEditing = editing
                }
            )
            TextField("", value: $dm.topicRadius, formatter: numberFormatter)
                .padding(6)
                .padding(.horizontal, 6)
                .background(.secondary.opacity(0.1))
                .cornerRadius(8)
                .frame(maxWidth: 58)
        }
    }
}

#Preview {
    RadiusCtrlView()
}
