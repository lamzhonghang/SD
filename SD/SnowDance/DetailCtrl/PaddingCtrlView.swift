//
//  PaddingCtrlView.swift
//  SD
//
//  Created by lan on 2023/11/30.
//

import SwiftUI

struct PaddingCtrlView: View {
    @ObservedObject var dm = designModel()
    var body: some View {
        Grid {
            PaddingPickerView(dm: dm)

            GridRow {
                Text("Padding")
                    .gridColumnAlignment(.leading)
                Slider(
                    value: $dm.topicPadding,
                    in: 0 ... 24,
                    step: 1,
                    onEditingChanged: { editing in
                        dm.isEditing = editing
                    }
                )
                TextField("", value: $dm.topicPadding, format: .number)
                    .customInput()
            }
            
            GridRow {
                Text("Visual Horizontal Padding Offset")
                    .gridColumnAlignment(.leading)
                Slider(
                    value: $dm.topicHorPadding,
                    in: 0 ... 16,
                    step: 1,
                    onEditingChanged: { editing in
                        dm.isEditing = editing
                    }
                )
                TextField("", value: $dm.topicHorPadding, format: .number)
                    .customInput()
            }
        }
    }
}

enum PaddingOption: String, CaseIterable {
    case small = "Small"
    case medium = "Middle"
    case large = "Large"

    func getPadding() -> Double {
        switch self {
        case .small:
            return 3
        case .medium:
            return 5
        case .large:
            return 7
        }
    }
}

struct PaddingPickerView: View {
    @ObservedObject var dm = designModel()

    var body: some View {
        HStack {
            Grid {
                GridRow {
                    ForEach(PaddingOption.allCases, id: \.self) { option in
                        VStack {
                            Text("Text")
                                .font(.system(size: 10))
                                .padding(option.getPadding())
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(4)
                                .frame(height: 20)
                            Text(option.rawValue)
                                .font(.footnote)
                                .foregroundColor(dm.selectPaddingIndex == option ? .primary : .secondary)
                        }
                        .frame(minWidth: 50)
                        .padding(12)
                        .background(.secondary.opacity(0.05))
                        .cornerRadius(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(dm.selectPaddingIndex == option ? Color.accentColor : .clear, lineWidth: 2)
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                dm.selectPaddingIndex = option
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
    PaddingCtrlView()
}
