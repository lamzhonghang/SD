//
//  Paywall_B_3.swift
//  SD
//
//  Created by lan on 2023/10/31.
//

import SwiftUI

struct Paywall_B_3: View {
    @State private var selectedSubscription: String?
    
    
    init() {
        _selectedSubscription = State(initialValue: "B")
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                bottomSubsView(selectedSubscription: $selectedSubscription)
                    .padding(.horizontal)
               
            }
        }
    }
}

struct sliderView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex){
            banner1View()
                .tag(0)
            banner2View()
                .tag(1)
        }
        .frame(height: 300)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

#Preview {
    Paywall_B_3()
}
