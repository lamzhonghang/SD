//
//  SDApp.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI

@main
struct SDApp: App {
    var body: some Scene {
        WindowGroup {
            mainEntryView()
        }
    }
}

enum mainEntry: Identifiable {
    case snowDance
    case payWall
    case token

    var id: Self { self }
}

struct mainEntryView: View {
    @State private var selectedView: mainEntry?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        TokenContentView()
//        VStack {
//            if horizontalSizeClass == .regular {
//                Button("Enter Snow Dance") {
//                    selectedView = .snowDance
//                }
//            }
//
//            Button("Enter Pay Wall") {
//                selectedView = .payWall
//            }
//
//            Button("Enter Token") {
//                selectedView = .token
//            }
//        }
            .fullScreenCover(item: $selectedView) { entry in
                switch entry {
                case .snowDance:
                    SDContentView()
                case .payWall:
                    Paywall_Entry()
                case .token:
                    TokenContentView()
                }
            }
    }
}
