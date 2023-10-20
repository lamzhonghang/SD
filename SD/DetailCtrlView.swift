//
//  DetailCtrlView.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI


struct DetailCtrlView: View {
    @ObservedObject var dm = designModel()
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Preset"){
                    Toggle(isOn: $dm.isRadial.animation(.bouncy(extraBounce: -0.1))){
                        Text("Radial Style")
                    }
                    Toggle(isOn: $dm.isBentoStyle.animation(.bouncy(extraBounce: -0.1))){
                        Text("Bento Style")
                    }
                    Toggle(isOn: $dm.isTreeTable.animation(.bouncy(extraBounce: -0.1))){
                        Text("Table Style")
                    }
                    Toggle(isOn: $dm.isTreeChart.animation(.bouncy(extraBounce: -0.1))){
                        Text("Tree Style")
                    }
                    Toggle(isOn: $dm.isOutline.animation(.bouncy(extraBounce: -0.1))){
                        Text("Outline Style")
                    }
                    Toggle(isOn: $dm.isTimeLine.animation(.bouncy(extraBounce: -0.1))){
                        Text("TImeline Style")
                    }
                }
                
                Section("Gap"){
                    HStack{
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
