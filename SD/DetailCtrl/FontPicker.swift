//
//  FontPicker.swift
//  SD
//
//  Created by lan on 2023/11/28.
//

import SwiftUI

enum FontDesignOption: String, CaseIterable {
    case sansSerif = "Sans"
    case serif = "Serif"
    case rounded = "Round"
    case monospaced = "Mono"

    func getfont() -> Font.Design {
        switch self {
        case .monospaced:
            return .monospaced
        case .rounded:
            return .rounded
        case .serif:
            return .serif
        case .sansSerif:
            return .default
        }
    }
}

struct AlignmentPickerView: View {
    @ObservedObject var dm = designModel()

    var body: some View {
        HStack {
            Grid {
                GridRow {
                    ForEach(FontDesignOption.allCases, id: \.self) { option in
                        VStack {
                            Text("Aa")
                                .fontDesign(option.getfont())
                            Text(option.rawValue)
                                .font(.footnote)
                        }
                        .frame(minWidth: 40)
                        .padding(12)
                        .foregroundColor(dm.selectFontIndex == option ? .primary : .secondary)
                        .background(.secondary.opacity(0.05))
                        .cornerRadius(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(dm.selectFontIndex == option ? Color.accentColor : .clear, lineWidth: 2)
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                dm.selectFontIndex = option
                            }
                        }
                    }
                }
            }
            Spacer()
        }
    }
}
