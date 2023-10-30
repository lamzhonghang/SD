//
//  BbannerView.swift
//  SD
//
//  Created by lan on 2023/10/28.
//

import SwiftUI

struct BBannerView: View {
    var body: some View {
        ZStack {
//            Image("curveLine")
//                .resizable()
//                .scaledToFill()
//                .offset(x: 80, y: -10)
//                .scaleEffect(1.5)
//                .opacity(0.3)
            VStack {
                HStack(alignment: .bottom){
                    Image("xmind")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundColor(Color(UIColor.label))
                    Image("Pro")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44)
                }
                .padding(8)
                .cornerRadius(16)
                .padding(.leading, 50)
                
                Text("Unleash the power of Xmind across all your devices.")
                    .multilineTextAlignment(.center)
                    .frame(width: 260)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .font(.subheadline)
            }
        }
        .padding(.bottom, 44)
        .frame(height: 140)
        .clipped()
    }
}


