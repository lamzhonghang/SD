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
    @State private var selectFontIndex = 0

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Layout")
                        .panelText(dm: dm)
                    styleSwitchView(dm: dm)
                }
                .padding()
                VStack {
                    Divider()
                    Text("Font")
                        .panelText(dm: dm)
                    FontPickerView(dm: dm)
                    fontCtrlView(dm: dm)
                    Divider()
                    Text("Gap")
                        .panelText(dm: dm)
                    GapCtrlView(dm: dm)
                    PaddingCtrlView(dm: dm)
                    Divider()
                    RadiusCtrlView(dm: dm)
                    BranchCtrlView(dm: dm)

                    Section {
                        Toggle(isOn: $dm.isFill.animation(.bouncy(extraBounce: -0.1))) {
                            Text("Fill")
                        }
                        Toggle(isOn: $dm.isBorder.animation(.bouncy(extraBounce: -0.1))) {
                            Text("Border")
                        }
                        Toggle(isOn: $dm.isBranch.animation(.bouncy(extraBounce: -0.1))) {
                            Text("Branch")
                        }

                        Toggle(isOn: $dm.isFilledHeight.animation(.bouncy(extraBounce: -0.1))) {
                            Text("Fill Container Height")
                        }
                        Toggle(isOn: $dm.isFilledWidth.animation(.bouncy(extraBounce: -0.1))) {
                            Text("Fill Container Width")
                        }
                        Toggle(isOn: $dm.isPadding.animation(.bouncy(extraBounce: -0.1))) {
                            Text("Padding")
                        }
//                        if dm.isPadding {
//                            Stepper(
//                                value: $dm.topicPadding.animation(.bouncy),
//                                in: 0...18,
//                                step: 6
//                            ) {
//                                Text("Padding: \(Int(dm.SubTopicHeight))")
//                            }
//                        }
                        Stepper(
                            value: $dm.topicFontSize.animation(.bouncy),
                            in: 0 ... 4,
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
                .padding(.horizontal, 20)
            }
            //            .formStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation {
                            dm.isDarkMode.toggle()
                        }
                    } label: {
                        Image(systemName: dm.isDarkMode ? "sun.max" : "moon")
                    }
                }
            }
        }
    }
}

#Preview {
    DetailCtrlView()
}
