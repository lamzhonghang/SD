//
//  BF_PopHor.swift
//  SD
//
//  Created by lan on 2023/11/6.
//

import SwiftUI

struct FloatingDecorationView: View {
    @State private var scaleEffectFactor = 0.9
    @Environment(\.horizontalSizeClass) var horSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verSizeClass: UserInterfaceSizeClass?
    
    var AdpativeCondition: Bool {
        horSizeClass == .regular ||
            (horSizeClass == .compact && verSizeClass == .compact)
        }
    
    var body: some View {
        ZStack{
            Image("maps")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .scaleEffect(scaleEffectFactor)
                .offset(x:-40, y: AdpativeCondition ? -140 : -165)
                .shadow(radius: 10)
            
            Image("rib")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .scaleEffect(scaleEffectFactor)
                .offset(x:-80, y: -200)
                .shadow(radius: 10)
            
            Image("video")
                .resizable()
                .scaledToFit()
                .frame(width: 110)
                .scaleEffect(scaleEffectFactor)
                .offset(x:AdpativeCondition ? -330 : -40, y: AdpativeCondition ? -130 : -170)
                .shadow(radius: 10)
                .opacity(AdpativeCondition ? 1 : 0)
            
            Image("star")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .scaleEffect(scaleEffectFactor)
                .offset(x: AdpativeCondition ? 200 : 180, y: 100)
                .shadow(radius: 10)
                .opacity(AdpativeCondition ? 1 : 0)
            
            
            Image("coupon")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .scaleEffect(scaleEffectFactor)
                .rotationEffect(.degrees(-40))
                .offset(x: AdpativeCondition ? 210 : 200, y: -120)
                .shadow(radius: 10)
            
            Image("voice")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .scaleEffect(scaleEffectFactor)
                .rotation3DEffect(.degrees(180),axis: (x: 0.0, y: 1, z: 0.0))
                .offset(x: AdpativeCondition ? 320 : 210, y:80)
            
            Image("rib")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .scaleEffect(scaleEffectFactor)
                .rotationEffect(.degrees(45))
                .offset(x:280, y: 80)
                .shadow(radius: 10)
                .opacity(AdpativeCondition ? 1 : 0)
            
            Image("gift")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .scaleEffect(scaleEffectFactor)
                .offset(x: AdpativeCondition ? -280 : -220, y: 80)
            
            Image("star_white_s")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .scaleEffect(scaleEffectFactor)
                .offset(x: -185, y: 140)
                .opacity(AdpativeCondition ? 1 : 0)
        }
    }
}

struct BFPopUpView: View {
    @Binding var showPopUp : Bool
    @State private var showScale = false
    @State private var showDecoration = false
    @State private var offsetY: CGFloat = 0.0
    @State private var direction: CGFloat = 1.0
    @State private var shake = false
    
    @Environment(\.horizontalSizeClass) var horSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verSizeClass: UserInterfaceSizeClass?
    
    var AdpativeCondition: Bool {
        horSizeClass == .regular ||
            (horSizeClass == .compact && verSizeClass == .compact)
        }
    
    var body: some View{
        ZStack {
            VStack{
                Image(AdpativeCondition ? "black_friday" : "black_friday_ver")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, horSizeClass == .compact && verSizeClass == .compact ? 40 : 80)
                    .frame(width: AdpativeCondition ? 600 : 300)
                    .shadow(color: .black.opacity(0.7), radius: 0, x:2,y:2)
                    .layoutPriority(0.1)
                Image("50off")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260)
                    .frame(minWidth: 260)
                    .padding(.vertical, 8)
                    .shadow(color: .white.opacity(0.7), radius: 10, x:2,y:2)
                    .shadow(color: .black.opacity(0.7), radius: 0, x:2,y:2)
                    .scaleEffect(showScale ? 1 : 1.01)
                
                GlowingButtonView(showPopUp: $showPopUp)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                
                Text("Offer Valid: Nov 23 - Nov 27, 2023")
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.top,6)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .font(.subheadline)
            }
            .padding(42)
            .padding(.vertical)
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(
                        RadialGradient(colors: [Color(hex: 0x2b2b2b), Color.black], center: .center, startRadius: 20, endRadius: 900)
                    )
                //ipad
                    .if(horSizeClass == .regular){
                        $0.frame(width: 740, height: 380)
                    }
                //small screen landscape
                    .if(horSizeClass == .compact && verSizeClass == .compact){
                        $0.frame(width: 640, height: 320)
                    }
                   
                    .overlay(alignment: .topTrailing){
                        HStack{
                            Spacer()
                            Button{
                                withAnimation(){
                                    showPopUp = false
                                }
                            }label:{
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title2)
                                    .imageScale(.large)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.white.opacity(0.3), .white.opacity(0.1))
                            }
                        }
                        .padding()
                    }
                    .overlay{
                        if showDecoration{
                            Image("RadiaLine")
                                .resizable()
                                .scaledToFill()
                                .offset(y: 40)
                                .opacity(0.2)
                                .transition(.scale(0.6).combined(with: .opacity))
                        }
                    }
                    .padding(20)
            )
            
            if showDecoration{
                FloatingDecorationView()
                    .transition(.scale(0.8).combined(with: .opacity))
                    .offset(y: offsetY)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                            startVerticalLoopingAnimation()
                        }
                    }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                withAnimation(.spring(dampingFraction: 0.6)){
                    showDecoration.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                withAnimation(.spring(dampingFraction: 0.6).repeatForever(autoreverses: true)){
                    shake.toggle()
                }
            }
        }
    }
    func startVerticalLoopingAnimation() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            withAnimation(Animation.easeInOut(duration: 1.0)) {
                offsetY += 2 * direction
            }
            direction *= -1
        }
        timer.fire()
    }
}

#Preview {
    BFPopUpView(showPopUp: .constant(true))
}
