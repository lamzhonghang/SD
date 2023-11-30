//
//  fontCtrlView.swift
//  SD
//
//  Created by lan on 2023/11/30.
//

import SwiftUI

struct fontCtrlView: View {
    @ObservedObject var dm = designModel()

    var body: some View {
        Grid {
            GridRow {
                Text("Central Fontsize")
                Slider(
                    value: $dm.centralFontSize,
                    in: 8 ... 20,
                    step: 1,
                    onEditingChanged: { editing in
                        dm.isEditing = editing
                    }
                )
                TextField("", value: $dm.centralFontSize, format: .number)
                    .customInput()
            }
            GridRow {
                Text("Maintopic Fontsize")
                    .gridColumnAlignment(.leading)
                Slider(
                    value: $dm.topicFontSize,
                    in: 8 ... 20,
                    step: 1,
                    onEditingChanged: { editing in
                        dm.isEditing = editing
                    }
                )
                TextField("", value: $dm.topicFontSize, format: .number)
                    .customInput()
            }
            GridRow {
                Text("Subtopic Fontsize")
                Slider(
                    value: $dm.subFontSize,
                    in: 8 ... 20,
                    step: 1,
                    onEditingChanged: { editing in
                        dm.isEditing = editing
                    }
                )
                TextField("", value: $dm.subFontSize, format: .number)
                    .customInput()
            }
            GridRow {
                Text("Fontsize Contrast")
                Slider(
                    value: $dm.fontSizeFactor,
                    in: 0 ... 8,
                    step: 1,
                    onEditingChanged: { editing in
                        dm.isEditing = editing
                    }
                )
                TextField("", value: $dm.fontSizeFactor, format: .number)
                    .customInput()
            }
        }
    }
}

#Preview {
    fontCtrlView()
}
