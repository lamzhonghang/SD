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
                    Text("Fill")
                        .panelText(dm: dm)
                    FillCtrlView(dm: dm)
                    Divider()
                    Text("Branch")
                        .panelText(dm: dm)
                    BranchCtrlView(dm: dm)
                    Divider()
                    Text("Border")
                        .panelText(dm: dm)
                    BorderCtrlView(dm: dm)
                    Divider()
                    Section {
                        Toggle(isOn: $dm.isFill.animation(.bouncy(extraBounce: -0.1))) {
                            Text("Fill")
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
                    }
                }
                .padding(.horizontal, 20)
            }
            .tint(.accentColor)
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
