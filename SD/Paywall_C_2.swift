//
//  Paywall_C_2.swift
//  SD
//
//  Created by lan on 2023/11/1.
//

import SwiftUI

struct blackCard: View {
    @State private var isFlipped = false
    @State private var glowing = false
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Image("xmind_pro")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .shadow(color: .white, radius: glowing ? 20 : 10, x: 0, y: 0)
                    
                        .shadow(color: .black, radius: 1, x: 1, y:1)
                }
                Spacer()
                HStack(){
                    Text("50% OFF")
                    Spacer()
                }
                .font(.title2)
                .fontWeight(.heavy)
                .shadow(color: .white, radius: 10, x: 0, y: 0)
                .shadow(color: .white.opacity(0.5), radius: glowing ? 20 : 10, x: 0, y: 0)
                .shadow(color: .black, radius: 1, x: 1, y:1)
            }
            .fontDesign(.rounded)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .frame(height: 220)
        .overlay{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.4), .clear, .white.opacity(0.3), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing),
                    lineWidth: 2
                )
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1), .clear, .white.opacity(0.05), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
        }
        .rotation3DEffect(
            .degrees(isFlipped ? 360 : 0),
            axis: (x: 0, y: 1, z: 0),
            perspective: 0.3
        )
        .background{
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.black.opacity(0.6))
                    .blur(radius: 30)
            }
        }
        .padding(.top, 12)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                withAnimation(Animation.bouncy(duration: 3.0, extraBounce: 0.1)) {
                    isFlipped.toggle()
                }
            }
            Timer.scheduledTimer(withTimeInterval: 7, repeats: true) { timer in
                withAnimation(Animation.bouncy(duration: 3.0)) {
                    isFlipped.toggle()
                }
            }
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                withAnimation(Animation.bouncy(duration: 3.0).repeatForever(autoreverses: true)) {
                    glowing.toggle()
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

struct ToolbarButton:View {
    @Binding var showPopUp: Bool
    @Binding var showCard: Bool
    @Binding var showButton: Bool
    
    var body: some View {
        Button{
            withAnimation(){
                showPopUp.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    withAnimation(Animation.spring()) {
                        showCard = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    withAnimation(Animation.spring()) {
                        showButton = true
                    }
                }
            }
        }label: {
            Text("50% OFF")
                .font(.body)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .shadow(color: .white, radius: 10, x: 0, y: 0)
                .shadow(color: .black, radius: 1, x: 1, y:1)
                .padding(12)
                .fontDesign(.rounded)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.clear)
                        .background(.background)
                        .environment(\.colorScheme, .dark)
                        .cornerRadius(12)
                }
        }
    }
}

struct GlowButtonView: View {
    @Binding var showGlow: Bool
    @Binding var showScale: Bool
    @Binding var showPopUp : Bool
    
    var body: some View {
        ZStack {
            Button{
                //
            }label: {
                HStack(spacing: 4){
                    Text("Start 1 years for")
                    Text("$29.99 !!")
                    Text("$59.99")
                        .strikethrough()
                    //                        .overlay{
                    //                            Image("strikethrough")
                    //                        }
                        .opacity(0.5)
                }
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .fontDesign(.rounded)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                        .overlay{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(
                                    LinearGradient(gradient: Gradient(colors: [ .black.opacity(0.7), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing),
                                    lineWidth: 3
                                )
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay{
                            LinearGradient(gradient: Gradient(colors: [ .clear,.black.opacity(0.1), .clear, .black.opacity(0.05), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .offset(x:showGlow ? 300 : -300)
                                .padding(.horizontal)
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        }
                    
                )
                .scaleEffect(showScale ? 1 : 1.01)
                .padding(.top)
            }
            .frame(maxWidth: 420)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)) {
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

struct popupHorView: View {
    @Binding var showPopUpHor : Bool
    @State private var showGlow = false
    @State private var showScale = false
    
    @Binding var showCard: Bool
    @Binding var showButton: Bool
    
    var body: some View{
        VStack{
            HStack(alignment: .top, spacing: 48){
                if showCard{
                    blackCard()
                        .transition(.opacity.combined(with: .scale(2.5)))
                }else{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.black)
                        .frame(height: 40)
                        .opacity(0.01)
                }
                VStack{
                    VStack(alignment: .leading){
                        Image("black_friday_ver")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280)
                            .padding(.top)
                        if showButton{
                            GlowButtonView(showGlow: $showGlow, showScale: $showScale, showPopUp: $showPopUpHor)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                            Text("Offer Valid: Nov 22 - Nov 27, 2023")
                                .foregroundColor(.white.opacity(0.6))
                                .padding(.top,6)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        } else{
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.black)
                                .frame(height: 40)
                                .opacity(0.01)
                        }
                    }
                    
                }
            }
        }
        .padding(42)
        .padding(.vertical)
        .background(
            Image("chaos")
            .resizable()
            .scaledToFit()
            .scaleEffect(1.5)
            .opacity(0.5)
            .padding(30)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        )
   
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.black)
        )
       
        .overlay(alignment: .topTrailing){
            HStack{
                Spacer()
                Button{
                    withAnimation(){
                        showPopUpHor = false
                    }
                }label:{
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .imageScale(.large)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white.opacity(0.3), .white.opacity(0.2))
                }
            }
            .padding()
        }
        .padding(20)
    }
}


struct popupView: View {
    @Binding var showPopUp : Bool
    @State private var showGlow = false
    @State private var showScale = false
    
    @Binding var showCard: Bool
    @Binding var showButton: Bool
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    withAnimation(){
                        showPopUp = false
                    }
                }label: {
                    Text("Not Now")
                        .foregroundColor(.white.opacity(0.3))
                        .padding(4)
                }
            }
            VStack{
                Text("Offer Valid: Nov 22 - Nov 27, 2023")
                    .foregroundColor(.white.opacity(0.6))
                Image("black_friday")
                    .resizable()
                    .scaledToFit()
            }
            .offset(y: 24)
            if showCard{
                blackCard()
                    .transition(.move(edge: .bottom).combined(with: .opacity).combined(with: .scale(1.5)))
            }else{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.black)
                    .frame(height: 40)
                    .opacity(0.01)
            }
            
            if showButton{
                GlowButtonView(showGlow: $showGlow, showScale: $showScale, showPopUp: $showPopUp)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            } else{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.black)
                    .frame(height: 40)
                    .opacity(0.01)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.black)
        )
        .padding(12)
    }
}

struct BlackFridayEntry: View {
    @Binding var showPopUp: Bool
    @Binding var showCard: Bool
    @Binding var showButton: Bool
    
    var body: some View {
        VStack{
            Button(action: {
                withAnimation(.spring().speed(2)){
                    self.showPopUp = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        withAnimation(Animation.spring()) {
                            showCard = true
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        withAnimation(Animation.spring()) {
                            showButton = true
                        }
                    }
                }
            }, label: {
                HStack(spacing:16){
                    VStack{
                        Text("50%")
                        Text("OFF")
                    }
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 10, x: 0, y: 0)
                    .shadow(color: .black, radius: 1, x: 1, y:1)
                    .padding(12)
                    .fontDesign(.rounded)
                    .background{
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.clear)
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                    }
                    
                    VStack(alignment: .leading){
                        Image("black_friday")
                            .resizable()
                            .scaledToFit()
                        HStack(spacing: 4){
                            Text("Start 1 years for")
                            Text("$29.99 !!")
                            Text("$59.99")
                                .strikethrough()
                            //                        .overlay{
                            //                            Image("strikethrough")
                            //                        }
                                .opacity(0.5)
                        }
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    }
                }
                .padding(12)
                .padding(.trailing,12)
            })
            .background(.black)
            .cornerRadius(20)
            .frame(maxWidth: 420)
        }
    }
}

struct Paywall_C_2: View {
    @State private var showPopUp = false
    @State private var showCard = false
    @State private var showButton = false
    @State private var showPopUpHor = false
    @State private var showWeb = false
    
    var body: some View {
        ZStack{
            HStack{
                ToolbarButton(showPopUp: $showPopUp, showCard: $showCard, showButton: $showButton)
                BlackFridayEntry(showPopUp: $showPopUpHor, showCard: $showCard, showButton: $showButton)
                Button{
                    showWeb.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        withAnimation(Animation.spring()) {
                            showCard = true
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        withAnimation(Animation.spring()) {
                            showButton = true
                        }
                    }
                }label: {
                    Text("Web")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
            }
            ZStack{
                Color.black
                    .opacity(showPopUp || showPopUpHor ? 0.3 : 0)
                    .ignoresSafeArea(.all)
                ZStack {
                    VStack{
                        if showPopUp{
                            popupView(showPopUp: $showPopUp, showCard: $showCard, showButton: $showButton)
                                .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .blur))
                                .frame(maxWidth: 420)
                        }
                        if showPopUpHor{
                            popupHorView(showPopUpHor: $showPopUpHor, showCard: $showCard, showButton: $showButton)
                                .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .blur))
                                .frame(maxWidth: 820)
                        }
                    }
                    .shadow(color:.black.opacity(0.2), radius:10, x:4 ,y:4)
                    .shadow(color:.black.opacity(0.15), radius:20, x:10 ,y:10)
                    .shadow(color:.black.opacity(0.1), radius:25, x:20 ,y:20)
                    .shadow(color:.black.opacity(0.06), radius:30, x:40 ,y:40)
                }
            }
        }
        .fullScreenCover(isPresented: $showWeb, content: {
            WebHeroView(showWeb: $showWeb, showCard: $showCard, showButton: $showButton)
                .preferredColorScheme(.dark)
        })
    }
}

struct WebHeroView: View {
    @Binding var showWeb : Bool
    @State private var showGlow = false
    @State private var showScale = false
    
    @Binding var showCard: Bool
    @Binding var showButton: Bool
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                VStack{
                    HStack{
                        Image("xmind")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .foregroundColor(.white)
                        Spacer()
                        HStack(spacing: 40){
                            Text("Features")
                            Text("Mindmaps")
                            Text("Pricing")
                            Text("Web")
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: 1400)
                }
                ///
                Spacer()
                VStack{
                    VStack(spacing: -24){
                        if showCard{
                            blackCard()
                                .transition(.opacity.combined(with: .scale(2.5)))
                                .frame(maxWidth: 360)
                                .zIndex(100)
                                .scaleEffect(2, anchor: .center)
                                .offset(y:-100)
                                .shadow(radius: 100)
                        }else{
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.black)
                                .frame(height: 40)
                                .opacity(0.01)
                        }
                        VStack{
                            VStack(){
                                Image("black_friday_large")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                                    .padding(.top)
                                    .padding(.bottom, 32)
                                    .frame(maxWidth: 2600)
                                if showButton{
                                    VStack{
                                        GlowButtonView(showGlow: $showGlow, showScale: $showScale, showPopUp: $showWeb)
                                            .transition(.move(edge: .bottom).combined(with: .opacity))
                                            .padding(.top, 100)
                                            .frame(maxWidth: 300)
                                        Text("Offer Valid: Nov 22 - Nov 27, 2023")
                                            .foregroundColor(.white.opacity(0.6))
                                            .padding(.top,6)
                                            .transition(.move(edge: .bottom).combined(with: .opacity))
                                    }
                                        .scaleEffect(2)
                                } else{
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.black)
                                        .frame(height: 40)
                                        .opacity(0.01)
                                }
                            }
                            
                        }
                    }
                }
                .padding(.top, 300)
                .padding(42)
                .padding(.vertical)
                .background(
                    Image("noise")
                    .resizable()
                    .scaledToFill()
                    .blendMode(.multiply)
                    .opacity(0.2)
                )
                .background(
                    Image("chaos")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(2)
                        .opacity(0.3)
                )
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(.black)
                )
                Spacer()
            }
        }
    }
}

private struct BlurModifier: ViewModifier {
    public let isIdentity: Bool
    public var intensity: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .blur(radius: isIdentity ? intensity : 0)
            .opacity(isIdentity ? 0 : 1)
    }
}

public extension AnyTransition {
    static var blur: AnyTransition {
        .blur()
    }
    
    static var blurWithoutScale: AnyTransition {
        .modifier(
            active: BlurModifier(isIdentity: true, intensity: 5),
            identity: BlurModifier(isIdentity: false, intensity: 5)
        )
    }
    
    static func blur(
        intensity: CGFloat = 100,
        scale: CGFloat = 0.9,
        scaleAnimation animation: Animation = .spring()
    ) -> AnyTransition {
        .scale(scale: scale)
        .animation(animation)
        .combined(
            with: .modifier(
                active: BlurModifier(isIdentity: true, intensity: intensity),
                identity: BlurModifier(isIdentity: false, intensity: intensity)
            )
        )
    }
}

#Preview {
    Paywall_C_2()
}


#Preview {
    blackCard()
        .preferredColorScheme(.dark)
}

