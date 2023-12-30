//
//  GridCtrlView.swift
//  SD
//
//  Created by lan on 2023/11/28.
//

import SwiftUI

struct GapCtrlView: View {
    @ObservedObject var dm = designModel()

    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }()

    var body: some View {
        Grid {
            GridRow {
                Text("Vertical Gap")
                    .gridColumnAlignment(.leading)
                Slider(
                    value: $dm.gridVerSpacing,
                    in: 0...100,
                    onEditingChanged: { editing in
                        dm.isEditing = editing
                    }
                )
                TextField("", value: $dm.gridVerSpacing, formatter: numberFormatter)
                    .customInput()
            }
            GridRow {
                Text("Horizontal Gap")
                Slider(
                    value: $dm.gridHorSpacing,
                    in: 0...100,
                    onEditingChanged: { editing in
                        dm.isEditing = editing
                    }
                )
                TextField("", value: $dm.gridHorSpacing, formatter: numberFormatter)
                    .customInput()
            }
        }
    }
}

#Preview {
    GapCtrlView()
}
