//
//  DesignModel.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI

class designModel: ObservableObject {
    @Published var topicPadding: Double = 12
    @Published var subTopicWidth: Double = 110
    @Published var mainTopicWidth: Double = 130
    @Published var centerTopicWidth: Double = 170
    @Published var topicMaxWidth: Double = 300
    @Published var isDarkMode: Bool = false
    @Published var selectStyleIndex: Int = 0
    @Published var showBulletPoint: Bool = false
    @Published var isSerif: Bool = false
    @Published var isSans: Bool = false
    @Published var isRounded: Bool = false
    @Published var isRadial: Bool = false{
        didSet{
            if isRadial{
                topicRadius = 200
                topicFontSize = 1
            } else{
                topicRadius = 12
            }
        }
    }
    @Published var isTimeLine: Bool = false{
        didSet{
            if isTimeLine{
                isFill = true
                topicPadding = 12
            }
        }
    }
    @Published var isOutline: Bool = false{
        didSet{
            if isOutline{
                showBulletPoint = true
                topicPadding = 2
                isFill = false
                topicFontSize = 2
            } else {
                showBulletPoint = false
            }
        }
    }
    @Published var isLeftAlign: Bool = false
    @Published var isTreeChart: Bool = false {
        didSet{
            if isTreeChart{
                isFilledWidth = true
            } else{
                isFilledWidth = false
            }
        }
    }
    @Published var topicColor: Color = Color(UIColor.systemGray5)
    @Published var isBento: Bool = false {
        didSet {
            if isBento {
                gridHorSpacing = 8
                gridVerSpacing = 8
                topicRadius = 12
                isFilledHeight = true
                isBorder = false
                isBranch = false
                topicPadding = 20
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
    @Published var isPadding: Bool = true{
        didSet{
            if isPadding{
                isFill = true
                topicPadding = 0
                isFilledWidth = false
            }else{
                isFill = false
            }
        }
    }
    @Published var isFilledHeight: Bool = false
    @Published var isFilledWidth: Bool = false
    @Published var topicRadius: Double = 8
    @Published var topicFontSize: Double = 0
    @Published var branchOpacity: Double = 0.3
    @Published var gridHorSpacing: Double
    @Published var gridVerSpacing: Double = 8
    @Published var topicHeight: CGFloat = 0.0
    @Published var isGrid: Bool = false {
        didSet {
            if isGrid{
                gridHorSpacing = 8
                gridVerSpacing = 8
                topicRadius = 12
                isFilledHeight = false
                isBorder = false
                isBranch = true
                topicPadding = 12
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
                topicRadius = 0
                isFilledHeight = true
                isBorder = true
                isBranch = false
                topicPadding = 20
                isFill = true
            } else {
                isGrid = true
            }
        }
    }
    init() {
        self.gridHorSpacing = UserDefaults.standard.object(forKey: "showWord") as? Double ?? 8
    }
}

enum FontDesign: String, CaseIterable, Identifiable {
    case defaultDesign = "Default"
    case serif = "Serif"
    case sansSerif = "Sans Serif"
    case monospaced = "Monospaced"
    
    var id: String { self.rawValue }
}

struct BulletPointView: View{
    @ObservedObject var dm = designModel()
    
    var body: some View{
        Circle()
            .frame(width: 4)
            .opacity(0.3)
    }
}

struct MainTopicModifier: ViewModifier {
    @ObservedObject var dm = designModel()
    
    func body(content: Content) -> some View {
        HStack{
            if dm.showBulletPoint{
                BulletPointView(dm: dm)
            }
            content
        }
        .font(.system(size: 16 + dm.topicFontSize))
        .contentTransition(.numericText())
        .padding(dm.isPadding ? dm.topicPadding : 0)
        .frame(maxHeight: dm.isFilledHeight ? .infinity : .none)
        .frame(maxWidth: dm.isFilledWidth ? .infinity : .none, alignment: .leading)
        .padding(2)
        .background(
            RoundedRectangle(cornerRadius: dm.topicRadius)
                .stroke(dm.isBorder ? Color(UIColor.systemGray3) : .clear, lineWidth: 2)
        )
        .frame(width: dm.isRadial ? dm.mainTopicWidth : .none, height: dm.isRadial ?  dm.mainTopicWidth : .none)
        .background(dm.isFill ?  dm.topicColor.opacity(0.7) : .clear)
        .cornerRadius(dm.topicRadius)
        .monospacedDigit()
        .padding(.leading, dm.isTreeChart ? 20 : 0)
        .bold()
        .fontDesign(dm.isSerif ? .serif : .default)
        //            .fontDesign(dm.isDefault ? .default : .serif)
        .fontDesign(dm.isRounded ? .serif : .monospaced)
    }
}




struct SubTopicModifier: ViewModifier {
    @ObservedObject var dm = designModel()
    
    func body(content: Content) -> some View {
        HStack{
            if dm.showBulletPoint{
                BulletPointView(dm: dm)
            }
            content
        }
        .font(.system(size: 16 - dm.topicFontSize / 2))
        .padding(dm.isPadding ? dm.topicPadding : 0)
        .frame(maxHeight: dm.isFilledHeight ? .infinity : .none)
        .frame(maxWidth: dm.isFilledWidth ? .infinity : .none, alignment: .leading)
        .padding(2)
        //        .frame(width: dm.isGrid && dm.isBentoStyle ? 0 : 130)
        .background(
            RoundedRectangle(cornerRadius: dm.topicRadius)
                .stroke(dm.isBorder ? Color(UIColor.systemGray3) : .clear, lineWidth: 2)
        )
        .frame(width: dm.isRadial ? dm.subTopicWidth : .none, height: dm.isRadial ?  dm.subTopicWidth : .none)
        .background(dm.isFill ? dm.topicColor.opacity(0.3) : .clear)
        .cornerRadius(dm.topicRadius)
        .monospacedDigit()
        .padding(.leading, dm.isTreeChart ? 40 : 0)
        .fontDesign(dm.isSerif ? .serif : .default)
        //        .fontDesign(dm.isDefault ? .default : .serif)
        .fontDesign(dm.isRounded ? .rounded : .default)
    }
}

struct CentralTopicModifier: ViewModifier {
    @ObservedObject var dm = designModel()
    
    func body(content: Content) -> some View {
        HStack{
            if dm.showBulletPoint{
                BulletPointView(dm: dm)
            }
            content
        }
        
        .font(.system(size: 16 + dm.topicFontSize * 2))
        .padding(dm.isPadding ? dm.topicPadding : 0)
        .frame(maxHeight: dm.isFilledHeight ? .infinity : .none)
        .frame(maxWidth: dm.isFilledWidth ? .infinity : .none, alignment: .leading)
        .padding(2)
        .background(
            RoundedRectangle(cornerRadius: dm.topicRadius)
                .stroke(dm.isBorder ? Color(UIColor.systemGray3) : .clear, lineWidth: 2)
        )
        .frame(width: dm.isRadial ? dm.centerTopicWidth : .none, height: dm.isRadial ?  dm.centerTopicWidth : .none)
        .background(dm.isFill ? dm.topicColor : .clear)
        .cornerRadius(dm.topicRadius)
        .monospacedDigit()
        .bold()
        .fontDesign(dm.isSerif ? .serif : .default)
        //            .fontDesign(dm.isDefault ? .default : .serif)
        .fontDesign(dm.isRounded ? .rounded : .default)
    }
}


struct PanelTextModifier: ViewModifier {
    @ObservedObject var dm = designModel()
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}


extension View {
    
    func mainTopic(dm: designModel) -> some View {
        self.modifier(MainTopicModifier(dm: dm))
    }
    
    func subTopic(dm: designModel) -> some View {
        self.modifier(SubTopicModifier(dm: dm))
    }
    
    func centralTopic(dm: designModel) -> some View {
        self.modifier(CentralTopicModifier(dm: dm))
    }
    
    func panelText(dm: designModel) -> some View {
        self.modifier(PanelTextModifier(dm: dm))
    }
    
    func BTitle() -> some View {
        self.modifier(BTitleModifier())
    }
}
