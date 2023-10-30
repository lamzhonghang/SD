//
//  DetailCtrlView.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI

struct styleSwitchView: View{
    @ObservedObject var dm = designModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 70))
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
            Option(name: "Radial", imageName: "circle.hexagonpath", action: $dm.isRadial, hasDropdown: false) {
            },
            Option(name: "Bento", imageName: "rectangle.3.group", action: $dm.isBento, hasDropdown: true) {
                dm.isFilledHeight = true
            },
            Option(name: "Table", imageName: "tablecells", action: $dm.isTreeTable, hasDropdown: false) {
            },
            Option(name: "Indent", imageName: "list.bullet.indent", action: $dm.isTreeChart, hasDropdown: true) {
            },
            Option(name: "Timeline", imageName: "calendar.day.timeline.left", action: $dm.isTimeLine, hasDropdown: true) {
            },
            Option(name: "Outline", imageName: "list.bullet.rectangle.portrait", action: $dm.isOutline, hasDropdown: false) {
            },
        ]
    }
    
    var body: some View{
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
                .overlay{
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

struct fontSwitchView: View{
    @ObservedObject var dm = designModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    struct Option: Identifiable, Hashable, Equatable {
        let id = UUID()
        let name: String
        let font: Font.Design
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
            Option(name: "Default", font: .default, action: $dm.isSans, hasDropdown: false) {
            },
            Option(name: "Serif", font: .serif, action: $dm.isSerif, hasDropdown: false) {
            },
            Option(name: "Rounded", font: .rounded, action: $dm.isRounded, hasDropdown: false) {
            },
        ]
    }
    
    var body: some View{
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(options.indices, id: \.self) { index in
                VStack(alignment: .center) {
                    Text("Aa")
                        .font(.title2)
                        .fontDesign(options[index].font)
                        Text(options[index].name)
                            .font(.footnote)
                            .padding(.top, 4)
                }
                .padding(.vertical)
                .foregroundColor(options[index].action ? .primary : .secondary)
                .frame(maxWidth: .infinity)
                .background(.secondary.opacity(0.05))
                .cornerRadius(12)
                .overlay{
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


struct DetailCtrlView: View {
    @ObservedObject var dm = designModel()
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16){
                VStack{
                    Text("Layout")
                        .panelText(dm: dm)
                    styleSwitchView(dm: dm)
                }
                VStack{
                    Text("Font")
                        .panelText(dm: dm)
                    fontSwitchView(dm: dm)
                }
            }
            .padding()
            Form{
                Section("Gap"){
                    HStack{
//                        TextField("", text: \($dm.gridHorSpacing)
                        Text("Ver Gap")
                        Slider(
                            value: $dm.gridVerSpacing,
                            in: 0...24,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                    }
                    HStack{
                        Text("Hor Gap")
                        Slider(
                            value: $dm.gridHorSpacing,
                            in: 0...24,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                    }
                }
                Section("Detail"){
                    HStack{
                        Text("Radius")
                        Slider(
                            value: $dm.topicRadius,
                            in: 0...30,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                    }
                }
                
                Section("Switch"){
                    Toggle(isOn: $dm.isFill.animation(.bouncy(extraBounce: -0.1))){
                        Text("Fill")
                    }
                    Toggle(isOn: $dm.isBorder.animation(.bouncy(extraBounce: -0.1))){
                        Text("Border")
                    }
                    Toggle(isOn: $dm.isBranch.animation(.bouncy(extraBounce: -0.1))){
                        Text("Branch")
                    }
                    if dm.isBranch{
                        HStack{
                            Text("Opacity")
                            Slider(
                                value: $dm.branchOpacity,
                                in: 0.1...1,
                                onEditingChanged: { editing in
                                    isEditing = editing
                                }
                            )
                        }
                    }
                    Toggle(isOn: $dm.isFilledHeight.animation(.bouncy(extraBounce: -0.1))){
                        Text("Fill Container Height")
                    }
                    Toggle(isOn: $dm.isFilledWidth.animation(.bouncy(extraBounce: -0.1))){
                        Text("Fill Container Width")
                    }
                    Toggle(isOn: $dm.isPadding.animation(.bouncy(extraBounce: -0.1))){
                        Text("Padding")
                    }
                    if dm.isPadding{
                        Stepper(
                            value: $dm.topicPadding.animation(.bouncy),
                            in: 0...18,
                            step: 6
                        ) {
                            Text("Padding: \(Int(dm.topicPadding))")
                        }
                    }
                    Stepper(
                        value: $dm.topicFontSize.animation(.bouncy),
                        in: 0...4,
                        step: 2
                    ) {
                        Text("Font Contrast: \(Int(dm.topicFontSize / 2))")
                    }
                }
                
                
                //            Section("Font"){
                //                Picker("",selection: $dm.topicFontFamilySelection){
                //                    ForEach(FontDesign.allCases, id: \.self) { design in
                //                           Text(design.rawValue)
                //                       }
                //                }
                //                .pickerStyle(.segmented)
                //            }
            }
            .formStyle(.grouped)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        withAnimation(){
                            dm.isDarkMode.toggle()
                        }
                    }label: {
                        Image(systemName: dm.isDarkMode ?  "sun.max" : "moon")
                    }
                }
            }
        }
    }
}

#Preview {
    DetailCtrlView()
}
