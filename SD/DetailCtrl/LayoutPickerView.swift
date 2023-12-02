//
//  LayoutPickerView.swift
//  SD
//
//  Created by lan on 2023/11/29.
//

import SwiftUI

struct styleSwitchView: View {
    @ObservedObject var dm = designModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 70)),
    ]
    
    struct Option: Identifiable, Hashable, Equatable {
        let id = UUID()
        let name: String
        let imageName: String
        let type: OptionType
        
        enum OptionType {
            case grid, radial, bento, table, indent, timeline, outline
        }
    }
    
    var options: [Option] {
        [
            Option(name: "Grid", imageName: "square.fill.text.grid.1x2", type: .grid),
            Option(name: "Radial", imageName: "circle.hexagonpath", type: .radial),
            Option(name: "Bento", imageName: "rectangle.3.group", type: .bento),
            Option(name: "Table", imageName: "tablecells", type: .table),
            Option(name: "Timeline", imageName: "lines.measurement.horizontal", type: .timeline),
            Option(name: "Indent", imageName: "chart.bar.doc.horizontal", type: .indent),
            Option(name: "Outline", imageName: "list.bullet.indent", type: .outline),
        ]
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(options.indices, id: \.self) { index in
                VStack(alignment: .center) {
                    Image(systemName: options[index].imageName)
                        .font(.title3)
                        .frame(height: 20)
                    Text(options[index].name)
                        .font(.footnote)
                        .padding(.top, 4)
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(.secondary.opacity(0.05))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(dm.selectStyleIndex == index ? Color.accentColor : .clear, lineWidth: 2)
                )
                .padding(.horizontal, 2)
                .onTapGesture {
                    withAnimation {
                        dm.selectStyleIndex = index
                        dm.selectOption(options[index])
                    }
                }
            }
        }
    }
}
