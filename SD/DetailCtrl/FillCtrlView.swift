//
//  RadiusCtrlView.swift
//  SD
//
//  Created by lan on 2023/11/29.
//

import SwiftUI

struct FillCtrlView: View {
    @ObservedObject var dm = designModel()
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }()

    var body: some View {
        Grid {
            Toggle("Fill", isOn: $dm.isFill.animation())
            if dm.isFill {
//                ColorPicker("Color", selection: $dm.topicColor, supportsOpacity: true)

                RadiusPickerView(dm: dm)
                GridRow {
                    Text("Topic Radius")
                        .gridColumnAlignment(.leading)
                    Slider(
                        value: $dm.topicRadius,
                        in: 0 ... 20,
                        onEditingChanged: { editing in
                            dm.isEditing = editing
                        }
                    )
                    TextField("", value: $dm.topicRadius, formatter: numberFormatter)
                        .customInput()
                }
                Toggle(isOn: $dm.isFilledHeight.animation(.bouncy(extraBounce: -0.1))) {
                    Text("Fill Container Height")
                }
                Toggle(isOn: $dm.isFilledWidth.animation(.bouncy(extraBounce: -0.1))) {
                    Text("Fill Container Width")
                }

//                GridRow {
//                    Text("Fill Opacity")
//                        .gridColumnAlignment(.leading)
//                    Slider(
//                        value: $dm.fillOpacity,
//                        in: 0 ... 0.2,
//                        step: 0.01,
//                        onEditingChanged: { editing in
//                            dm.isEditing = editing
//                        }
//                    )
//                    TextField("", value: $dm.fillOpacity, formatter: numberFormatter)
//                        .customInput()
//                }
//                GridRow {
//                    Text("Fill Hiranchy")
//                        .gridColumnAlignment(.leading)
//                    Slider(
//                        value: $dm.topicBrightness,
//                        in: 0 ... 1,
//                        step: 0.1,
//                        onEditingChanged: { editing in
//                            dm.isEditing = editing
//                        }
//                    )
//                    TextField("", value: $dm.topicBrightness, formatter: numberFormatter)
//                        .customInput()
//                }
            }
        }
    }
}

enum RadiusOption: String, CaseIterable {
    case small = "Straight"
    case medium = "Rounded"
    case large = "Capsule"

    func getRadius() -> Double {
        switch self {
        case .small:
            return 0
        case .medium:
            return 3
        case .large:
            return 50
        }
    }
}

struct RadiusPickerView: View {
    @ObservedObject var dm = designModel()

    var body: some View {
        HStack {
            Grid {
                GridRow {
                    ForEach(RadiusOption.allCases, id: \.self) { option in
                        VStack {
                            RoundedRectangle(cornerRadius: option.getRadius())
                                .stroke(lineWidth: 2)
                                .frame(width: 18, height: 14)
                                .padding(.vertical, 6)
                            Text(option.rawValue)
                                .font(.footnote)
                        }
                        .foregroundColor(dm.selectRadiusIndex == option ? .primary : .secondary)
                        .frame(minWidth: 50)
                        .padding(12)
                        .background(.secondary.opacity(0.05))
                        .cornerRadius(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(dm.selectRadiusIndex == option ? Color.accentColor : .clear, lineWidth: 2)
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                dm.selectRadiusIndex = option
                            }
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    FillCtrlView()
}
