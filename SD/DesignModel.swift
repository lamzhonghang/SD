//
//  DesignModel.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI

class designModel: ObservableObject {
    // fill
    @Published var isFill: Bool = true
    @Published var topicRadius: Double = 8
    @Published var topicColor: Color = Color(UIColor.systemGray6)
    @Published var fillOpacity: Double = 1
    @Published var topicBrightness: Double = 0
    var selectRadiusIndex: RadiusOption = .medium {
        didSet {
            switch selectRadiusIndex {
            case .small:
                topicRadius = 0
            case .medium:
                topicRadius = 8
            case .large:
                topicRadius = 100
            }
        }
    }

    // Gap
    @Published var gridHorSpacing: Double
    @Published var gridVerSpacing: Double = 8

    // Padding
    @Published var topicPadding: Double = 12
    var selectPaddingIndex: PaddingOption = .medium {
        didSet {
            switch selectPaddingIndex {
            case .large:
                topicPadding = 20
            case .medium:
                topicPadding = 12
            case .small:
                topicPadding = 6
            }
        }
    }

    @Published var topicHorPadding: Double = 4

    // branch
    @Published var isBranch: Bool = true
    @Published var branchWidth: Double = 6
    @Published var branchStroke: Double = 2
    @Published var branchsRadius: Double = 3
    @Published var branchOpacity: Double = 1
    @Published var branchColor: Color = Color(UIColor.label)

    // font
    @Published var subFontSize: Double = 12
    @Published var centralFontSize: Double = 12
    @Published var topicFontSize: Double = 12
    @Published var fontSizeFactor: Double = 2
    @Published var selectFontIndex: FontDesignOption = .sansSerif

    // Topic Width & Height
    @Published var MainTopicHeight: CGFloat = 0.0
    @Published var SubTopicHeight: CGFloat = 0.0
    @Published var subTopicWidth: Double = 110
    @Published var mainTopicWidth: Double = 130
    @Published var centerTopicWidth: Double = 170
    @Published var topicMaxWidth: Double = 300

    // Border
    @Published var BorderStroke: Double = 3
    @Published var isBorder: Bool = false

    // temps
    @Published var isDarkMode: Bool = false
    @Published var branchCenterToTopic = true
    @Published var selectStyleIndex: Int = 0
    @Published var showBulletPoint: Bool = false
    @Published var isEditing = false

    func selectOption(_ option: styleSwitchView.Option) {
        switch option.type {
        case .grid:
            isTimeLine = false
            isTreeChart = false
            isRadial = false
            isBorder = false
            gridHorSpacing = 4
            gridVerSpacing = 4
            topicRadius = 8
            isFilledHeight = false
            isBranch = true
            isFill = true
            selectPaddingIndex = .medium
            showBulletPoint = false
        case .radial:
            isRadial = true
            isTreeChart = false
            isTimeLine = false
            topicRadius = 200
            isBorder = false
            selectPaddingIndex = .medium
            isFill = true
            showBulletPoint = false
        case .timeline:
            isTreeChart = false
            isRadial = false
            isTimeLine = true
            isRadial = false
            isFill = true
            isBorder = false
            selectPaddingIndex = .medium
            showBulletPoint = false
            isFilledHeight = false
            topicRadius = 8
            gridHorSpacing = 0
            gridVerSpacing = 4
        case .bento:
            isTimeLine = false
            isTreeChart = false
            isRadial = false
            isBorder = false
            gridHorSpacing = 4
            gridVerSpacing = 4
            topicRadius = 8
            isFilledHeight = true
            isBorder = false
            isBranch = false
            isFill = true
            selectPaddingIndex = .medium
            showBulletPoint = false
        case .indent:
            isTreeChart = true
            isBorder = false
            isFilledWidth = true
            isFill = true
            topicRadius = 8
            selectPaddingIndex = .medium
            showBulletPoint = false
        case .table:
            isTimeLine = false
            isTreeChart = false
            isRadial = false
            isBorder = true
            isBranch = false
            isFilledHeight = true
            isFill = true
            gridHorSpacing = -1
            gridVerSpacing = -1
            topicRadius = 0
            BorderStroke = 1.5
            selectPaddingIndex = .medium
            showBulletPoint = false
        case .outline:
            isTreeTable = true
            isOutline = true
            isTreeChart = true
            isRadial = false
            isFill = false
            isBorder = false
            selectPaddingIndex = .small
            showBulletPoint = true
            isFilledHeight = false
            topicRadius = 0
        }
    }

    @Published var isRadial: Bool = false
    @Published var isTimeLine: Bool = false
    @Published var isOutline: Bool = false
    @Published var isLeftAlign: Bool = false
    @Published var isTreeChart: Bool = false {
        didSet {
            if isTreeChart {
                isFilledWidth = true
            } else {
                isFilledWidth = false
            }
        }
    }

    @Published var isBento: Bool = false

    @Published var isPadding: Bool = true {
        didSet {
            if isPadding {
                isFill = true
                isFilledWidth = false
            } else {
                isFill = false
            }
        }
    }

    @Published var isFilledHeight: Bool = false
    @Published var isFilledWidth: Bool = false
    @Published var isGrid: Bool = false
    @Published var isTreeTable: Bool = false {
        didSet {
            if isTreeTable {
                gridHorSpacing = 0
                gridVerSpacing = 0
                branchsRadius = 0
                isFilledHeight = true
                isBorder = true
                isBranch = false
                isFill = true
            } else {
                isGrid = true
            }
        }
    }

    @Published var fontDesign: Font.Design = .default
    init() {
        gridHorSpacing = UserDefaults.standard.object(forKey: "showWord") as? Double ?? 8
    }
}

struct BulletPointView: View {
    @ObservedObject var dm = designModel()

    var body: some View {
        Circle()
            .frame(width: 4)
            .opacity(0.3)
    }
}

struct MainTopicModifier: ViewModifier {
    @ObservedObject var dm = designModel()

    func body(content: Content) -> some View {
        HStack {
            if dm.showBulletPoint {
                BulletPointView(dm: dm)
            }
            content
        }
        .font(.system(size: dm.topicFontSize + dm.fontSizeFactor))
        .contentTransition(.numericText())
        .padding(dm.isPadding ? dm.topicPadding : 0)
        .padding(.horizontal, dm.topicHorPadding)
        .frame(maxHeight: dm.isFilledHeight ? .infinity : .none)
        .frame(maxWidth: dm.isFilledWidth ? .infinity : .none, alignment: .leading)
        .if(dm.isBorder) {
            $0.overlay(
                RoundedRectangle(cornerRadius: dm.topicRadius)
                    .stroke(.black, lineWidth: dm.BorderStroke)
            )
        }
        .frame(width: dm.isRadial ? dm.mainTopicWidth : .none, height: dm.isRadial ? dm.mainTopicWidth : .none)
        .if(dm.isFill) {
            $0.background {
                RoundedRectangle(cornerRadius: dm.topicRadius)
                    .fill(dm.topicColor)
//                    .opacity(dm.fillOpacity * 4)
            }
        }
        .cornerRadius(dm.topicRadius)
        .monospacedDigit()
        .padding(.leading, dm.isTreeChart ? 20 : 0)
        .bold()
        .fontDesign(dm.fontDesignStyle)
    }
}

struct SubTopicModifier: ViewModifier {
    @ObservedObject var dm = designModel()

    func body(content: Content) -> some View {
        HStack {
            if dm.showBulletPoint {
                BulletPointView(dm: dm)
            }
            content
        }
        .font(.system(size: dm.subFontSize))
        .padding(dm.isPadding ? dm.topicPadding : 0)
        .padding(.horizontal, dm.topicHorPadding)
        .contentTransition(.numericText())
        .frame(maxHeight: dm.isFilledHeight ? .infinity : .none)
        .frame(maxWidth: dm.isFilledWidth ? .infinity : .none, alignment: .leading)
        .if(dm.isBorder) {
            $0.overlay(
                RoundedRectangle(cornerRadius: dm.topicRadius)
                    .stroke(.black, lineWidth: dm.BorderStroke)
            )
        }
        .frame(width: dm.isRadial ? dm.subTopicWidth : .none, height: dm.isRadial ? dm.subTopicWidth : .none)
        .if(dm.isFill) {
            $0.background {
                RoundedRectangle(cornerRadius: dm.topicRadius)
                    .fill(dm.topicColor)
            }
        }
        .cornerRadius(dm.topicRadius)
        .monospacedDigit()
        .padding(.leading, dm.isTreeChart ? 40 : 0)
        .fontDesign(dm.fontDesignStyle)
    }
}

struct CentralTopicModifier: ViewModifier {
    @ObservedObject var dm = designModel()

    func body(content: Content) -> some View {
        HStack {
            if dm.showBulletPoint {
                BulletPointView(dm: dm)
            }
            content
        }
        .contentTransition(.numericText())
        .font(.system(size: dm.centralFontSize + dm.fontSizeFactor * 2))
        .padding(dm.isPadding ? dm.topicPadding : 0)
        .padding(.horizontal, dm.topicHorPadding)
        .frame(maxHeight: dm.isFilledHeight ? .infinity : .none)
        .frame(maxWidth: dm.isFilledWidth ? .infinity : .none, alignment: .leading)
        .padding(2)
        .if(dm.isBorder) {
            $0.overlay(
                RoundedRectangle(cornerRadius: dm.topicRadius)
                    .stroke(.black, lineWidth: dm.BorderStroke)
            )
        }
        .frame(width: dm.isRadial ? dm.centerTopicWidth : .none, height: dm.isRadial ? dm.centerTopicWidth : .none)
        .if(dm.isFill) {
            $0.background {
                RoundedRectangle(cornerRadius: dm.topicRadius)
                    .fill(dm.topicColor)
//                    .opacity(dm.fillOpacity)
            }
        }
        .cornerRadius(dm.topicRadius)
        .monospacedDigit()
        .bold()
        .fontDesign(dm.fontDesignStyle)
    }
}

struct PanelTextModifier: ViewModifier {
    @ObservedObject var dm = designModel()

    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(.tertiary)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 24)
    }
}

extension View {
    func mainTopic(dm: designModel) -> some View {
        modifier(MainTopicModifier(dm: dm))
    }

    func subTopic(dm: designModel) -> some View {
        modifier(SubTopicModifier(dm: dm))
    }

    func centralTopic(dm: designModel) -> some View {
        modifier(CentralTopicModifier(dm: dm))
    }

    func panelText(dm: designModel) -> some View {
        modifier(PanelTextModifier(dm: dm))
    }

    func BTitle() -> some View {
        modifier(BTitleModifier())
    }
}

extension designModel {
    var fontDesignStyle: Font.Design {
        switch selectFontIndex {
        case .sansSerif:
            return .default
        case .serif:
            return .serif
        case .rounded:
            return .rounded
        case .monospaced:
            return .monospaced
        }
    }

    var selectTopicPadding: Double {
        switch selectPaddingIndex {
        case .large:
            return topicPadding + 6
        case .medium:
            return topicPadding
        case .small:
            return topicPadding - 6
        }
    }
}
