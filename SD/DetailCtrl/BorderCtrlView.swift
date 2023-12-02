//
//  BorderCtrlView.swift
//  SD
//
//  Created by lan on 2023/11/30.
//

import SwiftUI

struct BorderCtrlView: View {
    @ObservedObject var dm = designModel()

    var body: some View {
        Grid {
            Toggle("Border", isOn: $dm.isBorder.animation())
            if dm.isBorder {
                GridRow {
                    Text("Border Stroke")
                        .gridColumnAlignment(.leading)
                    Slider(
                        value: $dm.BorderStroke,
                        in: 1 ... 10,
                        step: 1,
                        onEditingChanged: { editing in
                            dm.isEditing = editing
                        }
                    )
                    TextField("", value: $dm.BorderStroke, format: .number)
                        .customInput()
                }
            }
        }
    }
}

#Preview {
    BorderCtrlView()
}
