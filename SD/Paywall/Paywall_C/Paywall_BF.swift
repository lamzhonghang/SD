//
//  Paywall_BF.swift
//  SD
//
//  Created by lan on 2023/11/6.
//

import SwiftUI


struct Paywall_BF: View {
    @State private var showPopUp = false
    var body: some View {
        ZStack{
            HStack{
                BlackFridayEntry(showPopUp: $showPopUp)
                    .padding(20)
            }
            ZStack{
                Color.black
                    .opacity(showPopUp ? 0.3 : 0)
                    .ignoresSafeArea(.all)
                ZStack {
                    VStack{
                        if showPopUp{
                            BFPopUpView(showPopUp: $showPopUp)
                                .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .opacity))
                        }
                    }
                    .shadow(color:.black.opacity(0.2), radius:10, x:4 ,y:4)
                    .shadow(color:.black.opacity(0.15), radius:20, x:10 ,y:10)
                    .shadow(color:.black.opacity(0.1), radius:25, x:20 ,y:20)
                    .shadow(color:.black.opacity(0.06), radius:30, x:40 ,y:40)
                }
            }
        }
    }
}



#Preview {
    Paywall_BF()
}
