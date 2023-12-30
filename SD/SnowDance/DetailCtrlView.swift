//
//  DetailCtrlView.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import DynamicColor
import SwiftUI

enum segmentOption: String, CaseIterable {
    case detail = "Skeleton"
    case palette = "Palette"
}

struct DetailCtrlView: View {
    @ObservedObject var dm = designModel()
    @State private var isEditing = false
    @State private var selectFontIndex = 0
    @State private var segmentIndex: segmentOption = .detail

    var body: some View {
        NavigationStack {
            Picker("", selection: $segmentIndex) {
                ForEach(segmentOption.allCases, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.vertical, 6)
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
            switch segmentIndex {
            case .detail:
                DetailView(dm: dm)
            case .palette:
                PaletteView(dm: dm)
            }
        }
    }
}

struct Palette: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let action: ColorBarOption
    let color: Color
}

enum ColorBarOption: Int {
    case option1, option2

    func applyDesign(dm: designModel, colorScheme: ColorScheme) {
        switch self {
        case .option1:
            if colorScheme == .dark {
                dm.topicColor = GYColors.indigo.indigo500
                dm.centerTopicFontColor = .white
                dm.mainTopicFontColor = .white
                dm.subTopicFontColor = .white
                dm.mainTopicColor =  GYColors.indigo.indigo100
                dm.subTopicColor =  GYColors.indigo.indigo50
//                dm.mainBrightMount = 0
//                dm.subBrightMount = 0
//                dm.mainDarkenMount = 0.45
//                dm.subDarkenMount = 0.54
                dm.backgroundFillColor = GYColors.indigo.indigo950
            } else {
                dm.topicColor = GYColors.indigo.indigo500
                dm.centerTopicFontColor =  GYColors.indigo.indigo25
                dm.mainTopicFontColor = GYColors.indigo.indigo950
                dm.subTopicFontColor = GYColors.indigo.indigo950
                dm.mainTopicColor =  GYColors.indigo.indigo100
                dm.subTopicColor =  GYColors.indigo.indigo25
//                dm.branchColor = GYColors.indigo.indigo900
//                dm.mainDarkenMount = 0
//                dm.subDarkenMount = 0
//                dm.mainBrightMount = 0.33
//                dm.subBrightMount = 0.39
                dm.backgroundFillColor = GYColors.indigo.indigo25
            }
        case .option2:
            if colorScheme == .dark {
                dm.topicColor = .red
                dm.centerTopicFontColor = .white
                dm.mainTopicFontColor = .white
                dm.subTopicFontColor = .white
                dm.mainTopicColor = dm.topicColor
                dm.subTopicColor = dm.topicColor
//                dm.mainBrightMount = 0
//                dm.subBrightMount = 0
//                dm.mainDarkenMount = 0.45
//                dm.subDarkenMount = 0.54
                dm.backgroundFillColor = .indigo.opacity(0.02)
            } else {
                dm.topicColor = .red
                dm.centerTopicFontColor = .white
                dm.mainTopicFontColor = .black
                dm.subTopicFontColor = .black
                dm.mainTopicColor = dm.topicColor
//                dm.mainDarkenMount = 0
//                dm.subDarkenMount = 0
//                dm.mainBrightMount = 0.33
//                dm.subBrightMount = 0.39
                dm.subTopicColor = dm.topicColor
                dm.backgroundFillColor = .indigo.opacity(0.02)
            }
        }
    }
}

struct ColorBarView: View {
    @ObservedObject var dm = designModel()
    @State private var selectedPaletteIndex: Int?
    @Environment(\.colorScheme) var colorScheme
    @State private var initialTopicColor: Color = .clear

    var palette: [Palette] {
        [
            Palette(name: "1", action: .option1, color: .indigo),
            Palette(name: "2", action: .option2, color: .red)
        ]
    }

    var body: some View {
        let basecolor = DynamicColor(dm.topicColor).darkened(amount: dm.mainDarkenMount)
        let color = Color(basecolor.cgColor)
        VStack {
            HStack {
                ForEach(palette.indices, id: \.self) { index in
                    VStack {
                        Circle()
                            .fill(palette[index].color)
                            .frame(width: 32)
                            .padding(4)
                            .overlay {
                                Circle()
                                    .stroke(selectedPaletteIndex == index ? .indigo : .clear, lineWidth: 2)
                                    .frame(width: 40)
                            }
                            .onTapGesture {
                                withAnimation {
                                    let selectedOption = palette[index].action
                                     dm.currentDesignOption = selectedOption 
                                     selectedOption.applyDesign(dm: dm, colorScheme: colorScheme)
                                     selectedPaletteIndex = index
                                }
                            }
                    }
                    .onChange(of: colorScheme) {
                        dm.updateDesign(colorScheme: colorScheme)
                    }
                }
                Spacer()
                Circle()
                    .foregroundColor(color)
                    .frame(width: 40)
            }
            Grid{
                GridRow{
                    Text("Darken")
                    Slider(
                        value: $dm.mainDarkenMount,
                        in: 0 ... 1,
                        step: 0.01,
                        onEditingChanged: { editing in
                            dm.isEditing = editing
                        }
                    )
                    TextField("", value: $dm.mainDarkenMount, format: .number)
                        .customInput()
                }
                GridRow{
                    Text("Lighten")
                    Slider(
                        value: $dm.mainBrightMount,
                        in: 0 ... 1,
                        step: 0.01,
                        onEditingChanged: { editing in
                            dm.isEditing = editing
                        }
                    )
                    TextField("", value: $dm.mainBrightMount, format: .number)
                        .customInput()
                }
            }
           
           
//            .onChange(of: dm.brightness) {
//                updateTopicColor()
//            }
        }
    }

//    func updateTopicColor() {
//        let dynamicColor = DynamicColor(initialTopicColor).darkened(amount: dm.brightness)
//        dm.topicColor = Color(dynamicColor.cgColor)
//    }
//
//    private func updateInitialColor() {
//        if let index = selectedPaletteIndex, palette.indices.contains(index) {
//            initialTopicColor = palette[index].color
//        }
//    }
}

struct PaletteView: View {
    @ObservedObject var dm = designModel()
    @State private var FillColor = Color.red
    @State private var FontColor = Color.red
    var body: some View {
        ScrollView {
            VStack {
                Text("Preset")
                    .panelText(dm: dm)
                ColorBarView(dm: dm)
                Divider()
                ColorPicker("Fill Color", selection: $FillColor)
                ColorPicker("Font Color", selection: $FontColor)
                ColorPicker("Branch Color", selection: $dm.branchColor)
                ColorPicker("Background Fill", selection: $dm.backgroundFillColor)
                Divider()
                ColorPicker("Center Font Color", selection: $dm.centerTopicFontColor)
                ColorPicker("Main Font Color", selection: $dm.mainTopicFontColor)
                ColorPicker("Sub Font Color", selection: $dm.subTopicFontColor)
                Divider()
                ColorPicker("Center Fill", selection: $dm.topicColor)
                ColorPicker("Main Fill", selection: $dm.mainTopicColor)
                ColorPicker("Sub Fill", selection: $dm.subTopicColor)
                Divider()
            }
            .padding()
            .onChange(of: FontColor) {
                dm.centerTopicFontColor = FontColor
                dm.mainTopicFontColor = FontColor
                dm.subTopicFontColor = FontColor
            }
            .onChange(of: FillColor) {
                dm.topicColor = FillColor
                dm.mainTopicColor = FillColor
                dm.subTopicColor = FillColor
            }
//            .onAppear {
//                FontColor = dm.centerTopicFontColor
//                FillColor = dm.mainTopicColor
//            }
        }
    }
}

struct DetailView: View {
    @ObservedObject var dm = designModel()
    @State private var isEditing = false
    @State private var selectFontIndex = 0

    var body: some View {
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
            }
            .padding(.horizontal, 20)
        }
        .tint(.accentColor)
    }
}

#Preview {
    DetailCtrlView()
}
