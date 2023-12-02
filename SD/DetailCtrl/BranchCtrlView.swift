//
//  BranchCtrlView.swift
//  SD
//
//  Created by lan on 2023/11/29.
//

import SwiftUI

struct BranchCtrlView: View {
    @ObservedObject var dm = designModel()
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }()

    private let numberFormatter2: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()

    var body: some View {
        Grid {
            Toggle(isOn: $dm.isBranch.animation()) {
                Text("Branch")
            }
            if dm.isBranch {
                GridRow {
                    Text("Width")
                    Slider(
                        value: $dm.branchWidth,
                        in: 1 ... 30,
                        onEditingChanged: { editing in
                            dm.isEditing = editing
                        }
                    )
                    TextField("", value: $dm.branchWidth, formatter: numberFormatter)
                        .customInput()
                }

                GridRow {
                    Text("Stroke")
                    Slider(
                        value: $dm.branchStroke,
                        in: 1 ... 10,
                        onEditingChanged: { editing in
                            dm.isEditing = editing
                        }
                    )
                    TextField("", value: $dm.branchStroke, formatter: numberFormatter)
                        .customInput()
                }

                GridRow {
                    Text("Branch Radius")
                    Slider(
                        value: $dm.branchsRadius,
                        in: 0 ... 20,
                        onEditingChanged: { editing in
                            dm.isEditing = editing
                        }
                    )
                    TextField("", value: $dm.branchsRadius, formatter: numberFormatter)
                        .customInput()
                }

                GridRow {
                    Text("Opacity")
                    Slider(
                        value: $dm.branchOpacity,
                        in: 0 ... 1,
                        onEditingChanged: { editing in
                            dm.isEditing = editing
                        }
                    )
                    TextField("", value: $dm.branchOpacity, formatter: numberFormatter2)
                        .customInput()
                }
                .gridColumnAlignment(.leading)

                Toggle("Branch End in the Middle of Topic", isOn: $dm.branchCenterToTopic.animation(.bouncy))
            }
        }
    }
}

struct customInputFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(6)
            .padding(.horizontal, 6)
            .background(.secondary.opacity(0.1))
            .cornerRadius(8)
            .frame(maxWidth: 62)
            .keyboardType(.decimalPad)
    }
}

extension View {
    func customInput() -> some View {
        modifier(customInputFieldStyle())
    }
}

#Preview {
    BranchCtrlView()
}
