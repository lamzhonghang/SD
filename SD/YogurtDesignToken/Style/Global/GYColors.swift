//
//  GYColors.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import SwiftUI

enum GYColors: CaseIterable {
    static let palette = loadColorPaletteDictionary()

    // base
    enum base {
        static let white = GYColors.gray.gray25
        static let black = GYColors.gray.gray950
        static let gray = GYColors.gray.gray350
        static let darkGray = GYColors.gray.gray750
        static let red = GYColors.red.red500
        static let xRed = GYColors.xRed.xRed500
        static let orange = GYColors.orange.orange500
        static let yellow = GYColors.yellow.yellow500
        static let lime = GYColors.lime.lime500
        static let green = GYColors.green.green500
        static let teal = GYColors.teal.teal500
        static let cyan = GYColors.cyan.cyan500
        static let blue = GYColors.blue.blue500
        static let indigo = GYColors.indigo.indigo500
        static let violet = GYColors.violet.violet500
        static let purple = GYColors.purple.purple500
        static let pink = GYColors.pink.pink500
    }

    // gray
    enum gray {
        static let gray25 = colorValue(color: palette?.gray, key: "25", default: "#ffffff")
        static let gray50 = colorValue(color: palette?.gray, key: "50", default: "#fafbfc")
        static let gray100 = colorValue(color: palette?.gray, key: "100", default: "#f5f6f7")
        static let gray150 = colorValue(color: palette?.gray, key: "150", default: "#edf0f2")
        static let gray200 = colorValue(color: palette?.gray, key: "200", default: "#e4e7eb")
        static let gray250 = colorValue(color: palette?.gray, key: "250", default: "#d3d7db")
        static let gray300 = colorValue(color: palette?.gray, key: "300", default: "#bdc2c7")
        static let gray350 = colorValue(color: palette?.gray, key: "350", default: "#9ea3a8")
        static let gray400 = colorValue(color: palette?.gray, key: "400", default: "#878c92")
        static let gray450 = colorValue(color: palette?.gray, key: "450", default: "#747a80")
        static let gray500 = colorValue(color: palette?.gray, key: "500", default: "#676e74")
        static let gray550 = colorValue(color: palette?.gray, key: "550", default: "#596066")
        static let gray600 = colorValue(color: palette?.gray, key: "600", default: "#4e5459")
        static let gray650 = colorValue(color: palette?.gray, key: "650", default: "#43484d")
        static let gray700 = colorValue(color: palette?.gray, key: "700", default: "#383c40")
        static let gray750 = colorValue(color: palette?.gray, key: "750", default: "#2b2f33")
        static let gray800 = colorValue(color: palette?.gray, key: "800", default: "#1f2326")
        static let gray850 = colorValue(color: palette?.gray, key: "850", default: "#191c1f")
        static let gray900 = colorValue(color: palette?.gray, key: "900", default: "#121416")
        static let gray950 = colorValue(color: palette?.gray, key: "950", default: "#000000")
    }

    // red
    enum red {
        static let red25 = colorValue(color: palette?.red, key: "25", default: "#fcebeb")
        static let red50 = colorValue(color: palette?.red, key: "50", default: "#fbdddd")
        static let red100 = colorValue(color: palette?.red, key: "100", default: "#f6bbbb")
        static let red200 = colorValue(color: palette?.red, key: "200", default: "#f29999")
        static let red300 = colorValue(color: palette?.red, key: "300", default: "#ee7676")
        static let red400 = colorValue(color: palette?.red, key: "400", default: "#e95454")
        static let red500 = colorValue(color: palette?.red, key: "500", default: "#e53232")
        static let red600 = colorValue(color: palette?.red, key: "600", default: "#bf2a2a")
        static let red700 = colorValue(color: palette?.red, key: "700", default: "#992121")
        static let red800 = colorValue(color: palette?.red, key: "800", default: "#731919")
        static let red900 = colorValue(color: palette?.red, key: "900", default: "#4c1111")
        static let red950 = colorValue(color: palette?.red, key: "950", default: "#260808")
    }

    // x-red
    enum xRed {
        static let xRed25 = colorValue(color: palette?.xRed, key: "25", default: "#ffede9")
        static let xRed50 = colorValue(color: palette?.xRed, key: "50", default: "#fee1da")
        static let xRed100 = colorValue(color: palette?.xRed, key: "100", default: "#fdc3b4")
        static let xRed200 = colorValue(color: palette?.xRed, key: "200", default: "#fda58f")
        static let xRed300 = colorValue(color: palette?.xRed, key: "300", default: "#fc8669")
        static let xRed400 = colorValue(color: palette?.xRed, key: "400", default: "#fb6843")
        static let xRed500 = colorValue(color: palette?.xRed, key: "500", default: "#fa4a1e")
        static let xRed600 = colorValue(color: palette?.xRed, key: "600", default: "#d13e19")
        static let xRed700 = colorValue(color: palette?.xRed, key: "700", default: "#a73114")
        static let xRed800 = colorValue(color: palette?.xRed, key: "800", default: "#7d250f")
        static let xRed900 = colorValue(color: palette?.xRed, key: "900", default: "#54190a")
        static let xRed950 = colorValue(color: palette?.xRed, key: "950", default: "#290c05")
    }

    // orange
    enum orange {
        static let orange25 = colorValue(color: palette?.orange, key: "25", default: "#fef2e7")
        static let orange50 = colorValue(color: palette?.orange, key: "50", default: "#fde9d8")
        static let orange100 = colorValue(color: palette?.orange, key: "100", default: "#fbd3b0")
        static let orange200 = colorValue(color: palette?.orange, key: "200", default: "#f9bd89")
        static let orange300 = colorValue(color: palette?.orange, key: "300", default: "#f6a762")
        static let orange400 = colorValue(color: palette?.orange, key: "400", default: "#f4913a")
        static let orange500 = colorValue(color: palette?.orange, key: "500", default: "#f27b13")
        static let orange600 = colorValue(color: palette?.orange, key: "600", default: "#ca6710")
        static let orange700 = colorValue(color: palette?.orange, key: "700", default: "#a1520d")
        static let orange800 = colorValue(color: palette?.orange, key: "800", default: "#793e0a")
        static let orange900 = colorValue(color: palette?.orange, key: "900", default: "#512906")
        static let orange950 = colorValue(color: palette?.orange, key: "950", default: "#281403")
    }

    // yellow
    enum yellow {
        static let yellow25 = colorValue(color: palette?.yellow, key: "25", default: "#fffae8")
        static let yellow50 = colorValue(color: palette?.yellow, key: "50", default: "#fff4d1")
        static let yellow100 = colorValue(color: palette?.yellow, key: "100", default: "#fee89a")
        static let yellow200 = colorValue(color: palette?.yellow, key: "200", default: "#fedf76")
        static let yellow300 = colorValue(color: palette?.yellow, key: "300", default: "#fcd445")
        static let yellow400 = colorValue(color: palette?.yellow, key: "400", default: "#fccc22")
        static let yellow500 = colorValue(color: palette?.yellow, key: "500", default: "#f7c103")
        static let yellow600 = colorValue(color: palette?.yellow, key: "600", default: "#d2a811")
        static let yellow700 = colorValue(color: palette?.yellow, key: "700", default: "#a8860d")
        static let yellow800 = colorValue(color: palette?.yellow, key: "800", default: "#7e650a")
        static let yellow900 = colorValue(color: palette?.yellow, key: "900", default: "#544307")
        static let yellow950 = colorValue(color: palette?.yellow, key: "950", default: "#2a2103")
    }

    // lime
    enum lime {
        static let lime25 = colorValue(color: palette?.lime, key: "25", default: "#f3faea")
        static let lime50 = colorValue(color: palette?.lime, key: "50", default: "#ebf6dc")
        static let lime100 = colorValue(color: palette?.lime, key: "100", default: "#d7edb9")
        static let lime200 = colorValue(color: palette?.lime, key: "200", default: "#c3e496")
        static let lime300 = colorValue(color: palette?.lime, key: "300", default: "#afda73")
        static let lime400 = colorValue(color: palette?.lime, key: "400", default: "#9bd150")
        static let lime500 = colorValue(color: palette?.lime, key: "500", default: "#87c82d")
        static let lime600 = colorValue(color: palette?.lime, key: "600", default: "#71a726")
        static let lime700 = colorValue(color: palette?.lime, key: "700", default: "#5a851e")
        static let lime800 = colorValue(color: palette?.lime, key: "800", default: "#446417")
        static let lime900 = colorValue(color: palette?.lime, key: "900", default: "#2d430f")
        static let lime950 = colorValue(color: palette?.lime, key: "950", default: "#162107")
    }

    // green
    enum green {
        static let green25 = colorValue(color: palette?.green, key: "25", default: "#eaf5ee")
        static let green50 = colorValue(color: palette?.green, key: "50", default: "#dceee2")
        static let green100 = colorValue(color: palette?.green, key: "100", default: "#baddc5")
        static let green200 = colorValue(color: palette?.green, key: "200", default: "#97cca9")
        static let green300 = colorValue(color: palette?.green, key: "300", default: "#74bb8c")
        static let green400 = colorValue(color: palette?.green, key: "400", default: "#52aa6f")
        static let green500 = colorValue(color: palette?.green, key: "500", default: "#2f9952")
        static let green600 = colorValue(color: palette?.green, key: "600", default: "#278044")
        static let green700 = colorValue(color: palette?.green, key: "700", default: "#1f6637")
        static let green800 = colorValue(color: palette?.green, key: "800", default: "#184d29")
        static let green900 = colorValue(color: palette?.green, key: "900", default: "#10331b")
        static let green950 = colorValue(color: palette?.green, key: "950", default: "#08190e")
    }

    // teal
    enum teal {
        static let teal25 = colorValue(color: palette?.teal, key: "25", default: "#e6f5f5")
        static let teal50 = colorValue(color: palette?.teal, key: "50", default: "#d5efee")
        static let teal100 = colorValue(color: palette?.teal, key: "100", default: "#aadfde")
        static let teal200 = colorValue(color: palette?.teal, key: "200", default: "#80cfcd")
        static let teal300 = colorValue(color: palette?.teal, key: "300", default: "#55bebc")
        static let teal400 = colorValue(color: palette?.teal, key: "400", default: "#2aaeac")
        static let teal500 = colorValue(color: palette?.teal, key: "500", default: "#009e9b")
        static let teal600 = colorValue(color: palette?.teal, key: "600", default: "#008481")
        static let teal700 = colorValue(color: palette?.teal, key: "700", default: "#006967")
        static let teal800 = colorValue(color: palette?.teal, key: "800", default: "#004f4e")
        static let teal900 = colorValue(color: palette?.teal, key: "900", default: "#003534")
        static let teal950 = colorValue(color: palette?.teal, key: "950", default: "#001a1a")
    }

    // cyan
    enum cyan {
        static let cyan25 = colorValue(color: palette?.cyan, key: "25", default: "#e9f9fa")
        static let cyan50 = colorValue(color: palette?.cyan, key: "50", default: "#daf4f7")
        static let cyan100 = colorValue(color: palette?.cyan, key: "100", default: "#b6e8ee")
        static let cyan200 = colorValue(color: palette?.cyan, key: "200", default: "#92dbe5")
        static let cyan300 = colorValue(color: palette?.cyan, key: "300", default: "#6dcedb")
        static let cyan400 = colorValue(color: palette?.cyan, key: "400", default: "#49c3d2")
        static let cyan500 = colorValue(color: palette?.cyan, key: "500", default: "#2ab3c4")
        static let cyan600 = colorValue(color: palette?.cyan, key: "600", default: "#1e99a9")
        static let cyan700 = colorValue(color: palette?.cyan, key: "700", default: "#187a86")
        static let cyan800 = colorValue(color: palette?.cyan, key: "800", default: "#0f5f68")
        static let cyan900 = colorValue(color: palette?.cyan, key: "900", default: "#0c3e44")
        static let cyan950 = colorValue(color: palette?.cyan, key: "950", default: "#061f21")
    }

    // blue
    enum blue {
        static let blue25 = colorValue(color: palette?.blue, key: "25", default: "#ebf4fc")
        static let blue50 = colorValue(color: palette?.blue, key: "50", default: "#ddecfb")
        static let blue100 = colorValue(color: palette?.blue, key: "100", default: "#bbdaf6")
        static let blue200 = colorValue(color: palette?.blue, key: "200", default: "#99c7f2")
        static let blue300 = colorValue(color: palette?.blue, key: "300", default: "#69aeee")
        static let blue400 = colorValue(color: palette?.blue, key: "400", default: "#479eed")
        static let blue500 = colorValue(color: palette?.blue, key: "500", default: "#328fe5")
        static let blue600 = colorValue(color: palette?.blue, key: "600", default: "#2a77bf")
        static let blue700 = colorValue(color: palette?.blue, key: "700", default: "#215f99")
        static let blue800 = colorValue(color: palette?.blue, key: "800", default: "#194873")
        static let blue900 = colorValue(color: palette?.blue, key: "900", default: "#11304c")
        static let blue950 = colorValue(color: palette?.blue, key: "950", default: "#081826")
    }

    // indigo
    enum indigo {
        static let indigo25 = colorValue(color: palette?.indigo, key: "25", default: "#f1f2fd")
        static let indigo50 = colorValue(color: palette?.indigo, key: "50", default: "#e1e3fd")
        static let indigo100 = colorValue(color: palette?.indigo, key: "100", default: "#c9cef9")
        static let indigo200 = colorValue(color: palette?.indigo, key: "200", default: "#aaaffa")
        static let indigo300 = colorValue(color: palette?.indigo, key: "300", default: "#8f90f3")
        static let indigo400 = colorValue(color: palette?.indigo, key: "400", default: "#746cf7")
        static let indigo500 = colorValue(color: palette?.indigo, key: "500", default: "#6751f6")
        static let indigo600 = colorValue(color: palette?.indigo, key: "600", default: "#593ae9")
        static let indigo700 = colorValue(color: palette?.indigo, key: "700", default: "#4f20df")
        static let indigo800 = colorValue(color: palette?.indigo, key: "800", default: "#4008ba")
        static let indigo900 = colorValue(color: palette?.indigo, key: "900", default: "#290a85")
        static let indigo950 = colorValue(color: palette?.indigo, key: "950", default: "#140542")
    }

    // violet
    enum violet {
        static let violet25 = colorValue(color: palette?.violet, key: "25", default: "#f3eefc")
        static let violet50 = colorValue(color: palette?.violet, key: "50", default: "#e7ddf8")
        static let violet100 = colorValue(color: palette?.violet, key: "100", default: "#d5c4f3")
        static let violet200 = colorValue(color: palette?.violet, key: "200", default: "#bda2ed")
        static let violet300 = colorValue(color: palette?.violet, key: "300", default: "#a883e7")
        static let violet400 = colorValue(color: palette?.violet, key: "400", default: "#9263e3")
        static let violet500 = colorValue(color: palette?.violet, key: "500", default: "#8049df")
        static let violet600 = colorValue(color: palette?.violet, key: "600", default: "#6939b6")
        static let violet700 = colorValue(color: palette?.violet, key: "700", default: "#532f93")
        static let violet800 = colorValue(color: palette?.violet, key: "800", default: "#3d246c")
        static let violet900 = colorValue(color: palette?.violet, key: "900", default: "#281848")
        static let violet950 = colorValue(color: palette?.violet, key: "950", default: "#190f2e")
    }

    // purple
    enum purple {
        static let purple25 = colorValue(color: palette?.purple, key: "25", default: "#f6ecfa")
        static let purple50 = colorValue(color: palette?.purple, key: "50", default: "#f0dff6")
        static let purple100 = colorValue(color: palette?.purple, key: "100", default: "#e0c0ed")
        static let purple200 = colorValue(color: palette?.purple, key: "200", default: "#d1a0e5")
        static let purple300 = colorValue(color: palette?.purple, key: "300", default: "#c180dc")
        static let purple400 = colorValue(color: palette?.purple, key: "400", default: "#b161d3")
        static let purple500 = colorValue(color: palette?.purple, key: "500", default: "#a241ca")
        static let purple600 = colorValue(color: palette?.purple, key: "600", default: "#8736a8")
        static let purple700 = colorValue(color: palette?.purple, key: "700", default: "#6c2b87")
        static let purple800 = colorValue(color: palette?.purple, key: "800", default: "#512165")
        static let purple900 = colorValue(color: palette?.purple, key: "900", default: "#361643")
        static let purple950 = colorValue(color: palette?.purple, key: "950", default: "#1f0c27")
    }

    // pink
    enum pink {
        static let pink25 = colorValue(color: palette?.pink, key: "25", default: "#fbecf4")
        static let pink50 = colorValue(color: palette?.pink, key: "50", default: "#f8dfec")
        static let pink100 = colorValue(color: palette?.pink, key: "100", default: "#f1bfd9")
        static let pink200 = colorValue(color: palette?.pink, key: "200", default: "#ea9fc6")
        static let pink300 = colorValue(color: palette?.pink, key: "300", default: "#e37fb2")
        static let pink400 = colorValue(color: palette?.pink, key: "400", default: "#dd64a2")
        static let pink500 = colorValue(color: palette?.pink, key: "500", default: "#d94f96")
        static let pink600 = colorValue(color: palette?.pink, key: "600", default: "#b23575")
        static let pink700 = colorValue(color: palette?.pink, key: "700", default: "#8e2a5d")
        static let pink800 = colorValue(color: palette?.pink, key: "800", default: "#6b2046")
        static let pink900 = colorValue(color: palette?.pink, key: "900", default: "#47152f")
        static let pink950 = colorValue(color: palette?.pink, key: "950", default: "#230a17")
    }

    private static func colorValue(color: [String: ColorValue]?, key: String, default defaultHex: String) -> Color {
        if let hex = color?[key]?.hex {
            return Color(hex: hex)
        } else {
            return Color(hex: defaultHex)
        }
    }
}

extension GYColors.base {
    static let allBaseColors: [ColorInfo] = [
        ColorInfo(name: "White", color: white),
        ColorInfo(name: "Black", color: black),
        ColorInfo(name: "Gray", color: gray),
        ColorInfo(name: "Dark Gray", color: darkGray),
        ColorInfo(name: "Red", color: red),
        ColorInfo(name: "X Red", color: xRed),
        ColorInfo(name: "Orange", color: orange),
        ColorInfo(name: "Yellow", color: yellow),
        ColorInfo(name: "Lime", color: lime),
        ColorInfo(name: "Green", color: green),
        ColorInfo(name: "Teal", color: teal),
        ColorInfo(name: "Cyan", color: cyan),
        ColorInfo(name: "Blue", color: blue),
        ColorInfo(name: "Indigo", color: indigo),
        ColorInfo(name: "Violet", color: violet),
        ColorInfo(name: "Purple", color: purple),
        ColorInfo(name: "Pink", color: pink)
    ]
}

// extension GYColors {
//    enum Pink: String, CaseIterable {
//        case pink25 = "#fbecf4"
//        case pink50 = "#f8dfec"
//        case pink100 = "#f1bfd9"
//        case pink200 = "#ea9fc6"
//        case pink300 = "#e37fb2"
//        case pink400 = "#dd64a2"
//        case pink500 = "#d94f96"
//        case pink600 = "#b23575"
//        case pink700 = "#8e2a5d"
//        case pink800 = "#6b2046"
//        case pink900 = "#47152f"
//        case pink950 = "#230a17"
//
//        var details: (name: String, hex: String) {
//            switch self {
//            case .pink25: return ("pink25", self.rawValue)
//            case .pink50: return ("pink50", self.rawValue)
//            case .pink100: return ("pink100", self.rawValue)
//            case .pink200: return ("pink200", self.rawValue)
//            case .pink300: return ("pink300", self.rawValue)
//            case .pink400: return ("pink400", self.rawValue)
//            case .pink500: return ("pink500", self.rawValue)
//            case .pink600: return ("pink600", self.rawValue)
//            case .pink700: return ("pink700", self.rawValue)
//            case .pink800: return ("pink800", self.rawValue)
//            case .pink900: return ("pink900", self.rawValue)
//            case .pink950: return ("pink950", self.rawValue)
//            }
//        }
//    }
// }
//
// enum Purple: String, CaseIterable {
//    case purple25 = "#f6ecfa"
//    case purple50 = "#f0dff6"
//    case purple100 = "#e0c0ed"
//    case purple200 = "#d1a0e5"
//    case purple300 = "#c180dc"
//    case purple400 = "#b161d3"
//    case purple500 = "#a241ca"
//    case purple600 = "#8736a8"
//    case purple700 = "#6c2b87"
//    case purple800 = "#512165"
//    case purple900 = "#361643"
//    case purple950 = "#1f0c27"
//
//    var color: Color {
//        Color(hex: self.rawValue)
//    }
// }
