//
//  SDApp.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI
import TipKit

@main
struct SDApp: App {
    @State private var isPhone = UIDevice.current.userInterfaceIdiom == .phone
    
    var body: some Scene {
        WindowGroup {
            if isPhone{
                Paywall_Entry()
//                AiContentView()
            } else{
//                ContentView()
                Paywall_Entry()
//                AiContentView()
            }
        }
    }
}
