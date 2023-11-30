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
        @Binding var action: Bool
        let hasDropdown: Bool
        var dropdownAction: (() -> Void)?
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func ==(lhs: Option, rhs: Option) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    var options: [Option] {
        [
            Option(name: "Radial", imageName: "circle.hexagonpath", action: $dm.isRadial, hasDropdown: false) {},
            Option(name: "Bento", imageName: "rectangle.3.group", action: $dm.isBento, hasDropdown: true) {
                dm.isFilledHeight = true
            },
            Option(name: "Table", imageName: "tablecells", action: $dm.isTreeTable, hasDropdown: false) {},
            Option(name: "Indent", imageName: "list.bullet.indent", action: $dm.isTreeChart, hasDropdown: true) {},
            Option(name: "Timeline", imageName: "calendar.day.timeline.left", action: $dm.isTimeLine, hasDropdown: true) {},
            Option(name: "Outline", imageName: "list.bullet.rectangle.portrait", action: $dm.isOutline, hasDropdown: false) {},
        ]
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(options.indices, id: \.self) { index in
                VStack(alignment: .center) {
                    Image(systemName: options[index].imageName)
                        .font(.title2)
                    Text(options[index].name)
                        .font(.footnote)
                        .padding(.top, 4)
                }
                .padding(.vertical)
                .foregroundColor(options[index].action ? .primary : .secondary)
                .frame(maxWidth: .infinity)
                .background(.secondary.opacity(0.05))
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(options[index].action ? Color(UIColor.label) : .clear, lineWidth: 2)
                }
                .padding(.horizontal, 2)
                .onTapGesture {
                    withAnimation {
                        for i in options.indices {
                            options[i].action = (i == index)
                        }
                        dm.selectStyleIndex = index
                    }
                }
            }
        }
    }
}
