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
        Grid {
            Text("Radius")
                .panelText(dm: dm)
            RadiusPickerView(dm: dm)
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
    RadiusCtrlView()
}
