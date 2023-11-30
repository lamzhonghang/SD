//
//  GlowingButtonView.swift
//  SD
//
//  Created by lan on 2023/11/7.
//

import SwiftUI

struct GlowingButtonView: View {
    @State private var showGlow = false
    @State private var showScale = false
    @Binding var showPopUp : Bool
    
    var body: some View {
        ZStack {
            Button{
                //
            }label: {
                HStack(spacing: 4){
                    Text("Get 1 year for $29.99 !!")
                        .multilineTextAlignment(.leading)
                    Text("$59.99")
                        .strikethrough()
                        .opacity(0.5)
                        .lineLimit(1)
                }
                .bold()
                .foregroundColor(.white)
                .fontDesign(.rounded)
                .font(.subheadline)
                .minimumScaleFactor(0.8)
                .padding()
                .padding(.horizontal, 6)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.red)
                        .overlay{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(
                                    LinearGradient(gradient: Gradient(colors: [ .white.opacity(0.3), .white.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing),
                                    lineWidth: 3
                                )
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay{
                            LinearGradient(gradient: Gradient(colors: [ .clear,.white.opacity(0.3), .clear, .white.opacity(0.1), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .offset(x:showGlow ? 300 : -300)
                                .padding(.horizontal)
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        }
                )
                .scaleEffect(showScale ? 1 : 1.02)
                .padding(.top)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                    showGlow.toggle()
                }
            }
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                withAnimation(Animation.bouncy())  {
                    showScale.toggle()
                }
            }
        }
    }
}

//#Preview {
//    GlowingButtonView()
//}
