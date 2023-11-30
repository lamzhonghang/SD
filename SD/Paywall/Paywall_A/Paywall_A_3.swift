//
//  Paywall_A_4.swift
//  SD
//
//  Created by lan on 2023/10/21.
//

import SwiftUI

struct Paywall_A_3: View {
    @State private var isRemind : Bool = false
    @StateObject private var motion = MotionManager()
    @State private var isFlipped = false
    @State private var isBackFlipped = false
    @State private var showWord = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack(alignment:.top){
                //                Image("noise")
                //                    .resizable()
                //                    .scaledToFit()
                //                    .blendMode(.multiply)
                Text("Limited Special Offer")
                    .font(.largeTitle)
                    .fontWeight(.black)
                Image("curveLine")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -50)
                ScrollView{
                    VStack{
                        VStack{
                            HStack{
                                Image("xmind_pro")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .shadow(color: .white, radius: 10, x: 0, y: 0)
                                    .shadow(color: .black, radius: 1, x: 1, y:1)
                            }
                            Spacer()
                            VStack(alignment: .leading){
                                Text("For Alex")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                HStack{
                                    Text("14 DAYS")
                                        .fontWeight(.black)
                                    Text("Free Trail")
                                }
                                
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
                        .onTapGesture{
                            withAnimation(Animation.bouncy(duration: 3.0, extraBounce: 0.1)) {
                                isFlipped.toggle()
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                withAnimation(Animation.bouncy(duration: 3.0, extraBounce: 0.1)) {
                                    isFlipped.toggle()
                                }
                            }
                            
                            Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
                                withAnimation(Animation.bouncy(duration: 3.0)) {
                                    isFlipped.toggle()
                                }
                            }
                        }
                        
                        //                    .rotation3DEffect(.degrees(motion.x * 5), axis: (x: 0, y: 1, z: 0))
                        //                    .rotation3DEffect(.degrees(motion.y * 5), axis: (x: 1, y: 0, z: 0))
                    }
                    .padding()
                    if showWord{
                        Text("Enjoy 14 days of free access to all unlimited premium features!")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Text("Not Now")
                            .foregroundStyle(.tertiary)
                            .padding(.horizontal, 8)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                        withAnimation(Animation.bouncy) {
                            showWord.toggle()
                        }
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    VStack(spacing: 16){
                        HStack{
                            Button{
                                withAnimation(){
                                    isRemind.toggle()
                                }
                            } label: {
                                Image(systemName: isRemind ?  "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(isRemind ? .primary : .secondary)
                                    .tint(.white)
                                    .imageScale(.large)
                                
                            }
                            Text("Remind me before the free trial ends")
//                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        Button{
                            //
                        } label: {
                            Text("Let's Start Free Trail")
                                .frame(maxWidth: .infinity)
                                .tint(.white)
                                .padding()
                                .background(.red)
                                .fontWeight(.semibold)
                                .clipShape( RoundedRectangle(cornerRadius: 14, style: .continuous))
                                .padding(.horizontal)
                        }
                        
                        Text("You won't be charged until after your 14 days trail. then just $59.99 per year. Cancel anytime.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview("paywall4"){
    Paywall_A_3()
}
