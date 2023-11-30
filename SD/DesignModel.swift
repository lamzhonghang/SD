//
//  DesignModel.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI

class designModel: ObservableObject {
   
    @Published var topicRadius: Double = 8
    var selectRadiusIndex : RadiusOption = .medium{
        didSet{
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
    
    //Padding
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
    
    
    
    
    @Published var isDarkMode: Bool = false
    @Published var selectStyleIndex: Int = 0
    @Published var showBulletPoint: Bool = false
    @Published var isEditing = false
    
    //branch
    @Published var branchWidth: Double = 8
    @Published var branchStroke: Double = 2

    //font
    @Published var subFontSize: Double = 12
    @Published var centralFontSize: Double = 12
    @Published var topicFontSize: Double = 12
    @Published var fontSizeFactor: Double = 0
    @Published var selectFontIndex: FontDesignOption = .serif

    //Topic Width & Height
    @Published var MainTopicHeight: CGFloat = 0.0
    @Published var SubTopicHeight: CGFloat = 0.0
    @Published var subTopicWidth: Double = 110
    @Published var mainTopicWidth: Double = 130
    @Published var centerTopicWidth: Double = 170
    @Published var topicMaxWidth: Double = 300

    @Published var isRadial: Bool = false {
        didSet {
            if isRadial {
                branchsRadius = 200
            } else {
                branchsRadius = 12
            }
        }
    }

    @Published var isTimeLine: Bool = false {
        didSet {
            if isTimeLine {
                isFill = true

            }
        }
    }

    @Published var isOutline: Bool = false {
        didSet {
            if isOutline {
                showBulletPoint = true

                isFill = false
                topicFontSize = 2
            } else {
                showBulletPoint = false
            }
        }
    }

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

    @Published var topicColor: Color = .init(UIColor.systemGray5)
    @Published var isBento: Bool = false {
        didSet {
            if isBento {
                gridHorSpacing = 8
                gridVerSpacing = 8
                branchsRadius = 12
                isFilledHeight = true
                isBorder = false
                isBranch = false
                isFilledWidth = false
                isFill = true
                topicFontSize = 0
            } else {
                isGrid = true
            }
        }
    }

    @Published var isBorder: Bool = false
    @Published var isFill: Bool = true
    @Published var isBranch: Bool = true
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
    @Published var branchsRadius: Double = 8

    @Published var branchOpacity: Double = 1
    @Published var gridHorSpacing: Double
    @Published var gridVerSpacing: Double = 8
    @Published var topicHeight: CGFloat = 0.0
    @Published var branchCenterToTopic = true

    @Published var isGrid: Bool = false {
        didSet {
            if isGrid {
                gridHorSpacing = 8
                gridVerSpacing = 8
                branchsRadius = 12
                isFilledHeight = false
                isBorder = false
                isBranch = true
//                topicPadding = 12
                branchOpacity = 0.3
                isFilledWidth = false
            } else {
                //
            }
        }
    }

    @Published var isTreeTable: Bool = false {
        didSet {
            if isTreeTable {
                gridHorSpacing = 0
                gridVerSpacing = 0
                branchsRadius = 0
                isFilledHeight = true
                isBorder = true
                isBranch = false
//                topicPadding = 20
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
        .background(
            RoundedRectangle(cornerRadius: dm.branchsRadius)
                .stroke(dm.isBorder ? Color(UIColor.systemGray3) : .clear, lineWidth: 2)
        )
        .frame(width: dm.isRadial ? dm.mainTopicWidth : .none, height: dm.isRadial ? dm.mainTopicWidth : .none)
        .background(dm.isFill ? dm.topicColor.opacity(0.7) : .clear)
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
        //        .frame(width: dm.isGrid && dm.isBentoStyle ? 0 : 130)
        .background(
            RoundedRectangle(cornerRadius: dm.branchsRadius)
                .stroke(dm.isBorder ? Color(UIColor.systemGray3) : .clear, lineWidth: 2)
        )
        .frame(width: dm.isRadial ? dm.subTopicWidth : .none, height: dm.isRadial ? dm.subTopicWidth : .none)
        .background(dm.isFill ? dm.topicColor.opacity(0.3) : .clear)
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
        .background(
            RoundedRectangle(cornerRadius: dm.branchsRadius)
                .stroke(dm.isBorder ? Color(UIColor.systemGray3) : .clear, lineWidth: 2)
        )
        .frame(width: dm.isRadial ? dm.centerTopicWidth : .none, height: dm.isRadial ? dm.centerTopicWidth : .none)
        .background(dm.isFill ? dm.topicColor : .clear)
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
        switch selectPaddingIndex{
        case .large:
            return topicPadding + 6
        case .medium:
            return topicPadding
        case .small:
            return topicPadding - 6
        }
    }
}
