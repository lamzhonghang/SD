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
                Paywall_C_2()
            } else{
                Paywall_C_2()
            }
        }
    }
}
