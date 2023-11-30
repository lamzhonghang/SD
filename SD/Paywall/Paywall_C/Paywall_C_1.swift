//
//  Paywall_A_3.swift
//  SD
//
//  Created by lan on 2023/10/22.
//

import SwiftUI

struct Paywall_C_1: View {
    @State private var timeRemaining = 24 * 60 * 60
    @Environment(\.dismiss) private var dismiss
    @State private var isHighlight = false
    @State private var showTitle = false
    @State private var showGlow = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 12){
                    Spacer()
                    Image(systemName: "bolt.fill")
                        .font(.largeTitle)
                        .imageScale(.large)
                        .foregroundColor(.red)
                        .symbolEffect(.bounce, value: isHighlight)
                    Text("Personal Flash Sale")
                        .font(.subheadline)
                        .bold()
                    if showTitle{
                        Text("Up to 30% OFF")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .transition(.scale(0.2).combined(with: .opacity))
                    }
                   
                    twoVerSubscriptionView()
                        .padding(.vertical, 20)
                    Spacer()
                }
                .fontDesign(.rounded)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            dismiss()
                        }label:{
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .font(.subheadline)
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 16){
                VStack{
                    HStack{
                        Text("Sale Ending in")
                            .textCase(.uppercase)
                        HStack(spacing: 4){
                            Text("\(hoursString(from: timeRemaining))")
                            VStack(spacing:3){
                                Circle()
                                    .frame(width: 2.5)
                                Circle()
                                    .frame(width: 2.5)
                            }
                            Text("\(minutesString(from: timeRemaining))")
                            VStack(spacing:3){
                                Circle()
                                    .frame(width: 2.5)
                                Circle()
                                    .frame(width: 2.5)
                            }
                            Text("\(secondsString(from: timeRemaining))")
                        }
                        .monospacedDigit()
                        .bold()
                    }
                    .font(.subheadline)
                    .padding(.top)
                }
                Button{
                    //
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .tint(.white)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .fontWeight(.semibold)
                        .clipShape( RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .padding(.horizontal)
                        .shadow(color: .red.opacity(0.1), radius: 12, x: 8, y:8)
                        .shadow(color: .red.opacity(0.2), radius: 8, x: 4, y:4)
                        .shadow(color: .red.opacity(0.3), radius: 4, x: 2, y:2)
                     
                        .overlay{
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(
                                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.4),.white.opacity(0.1),]), startPoint: .topLeading, endPoint: .bottomTrailing),
                                    lineWidth: 1.5
                                )
                                .padding(.horizontal)
                        }
                        .scaleEffect(isHighlight ? 1.01 : 1)
                }
               
                .overlay{
                    LinearGradient(gradient: Gradient(colors: [ .clear,.clear,.white.opacity(0.3),.clear, .clear, .white.opacity(0.1), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .offset(x:showGlow ? -500 : 500)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .padding(.horizontal)
                }
                
                HStack{
                    Text("After current period, your subscription automatically renews with ¥271.00 for yealy plan.")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            }
            .background(.ultraThinMaterial)
        }
        .onAppear{
            startTimer()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                withAnimation(Animation.bouncy(duration: 0.5)) {
                    showTitle.toggle()
                }
            }
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                withAnimation(Animation.bouncy(duration: 1.8)) {
                    showGlow.toggle()
                }
            }
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                withAnimation(Animation.bouncy())  {
                    isHighlight.toggle()
                }
            }
        }
    }
    func startTimer() {
        // 创建一个后台队列，每秒触发一次
        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        timer.schedule(deadline: .now(), repeating: .seconds(1))
        timer.setEventHandler {
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.cancel()
            }
        }
        timer.resume()
    }
    
    func hoursString(from seconds: Int) -> String {
        let hours = seconds / 3600
        return String(format: "%02d", hours)
    }
    
    func minutesString(from seconds: Int) -> String {
        let minutes = (seconds % 3600) / 60
        return String(format: "%02d", minutes)
    }
    
    func secondsString(from seconds: Int) -> String {
        let seconds = seconds % 60
        return String(format: "%02d", seconds)
    }
}

struct twoVerSubscriptionView: View{
    @State private var selectedSubscription: String? = nil
    
    init() {
        _selectedSubscription = State(initialValue: "B")
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 16){
            VStack(spacing: 12){
                HStack(alignment: .firstTextBaseline, spacing: 4){
                    Text("¥38.00")
                        .font(.title2)
                        .bold()
                    Text("/ month")
                        .font(.footnote)
                    Spacer()
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.quaternarySystemFill))
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(selectedSubscription == "A" ? Color.red : .clear, lineWidth: 6)
                )
                .onTapGesture {
                    withAnimation(){
                        selectedSubscription = "A"
                    }
                }
                .cornerRadius(16)
                VStack{
                    HStack(spacing: 4){
                        VStack(alignment: .leading, spacing: 4){
                            HStack(spacing: 4){
                                Image(systemName: "bolt.fill")
                                Text("Limited Time Offer")
                                    .textCase(.uppercase)
                                Spacer()
                                Text("30% OFF")
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .padding(.horizontal, 4)
                                    .bold()
                                    .background(Capsule().fill(.red))
                                    .offset(x: 24, y: -14)
                            }
                            .foregroundColor(.red)
                            .bold()
                            .font(.footnote)
                            VStack(alignment: .leading, spacing: 4){
                                HStack(alignment:.firstTextBaseline, spacing: 4){
                                    Text("¥271.00")
                                        .font(.title2)
                                        .bold()
                                    Text("/ year")
                                        .font(.footnote)
                                }
                                Text("¥388.00")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .strikethrough()
                                    .bold()
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.quaternarySystemFill))
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(selectedSubscription == "B" ? Color.red : .clear, lineWidth: 6)
                    )
                    .onTapGesture {
                        withAnimation(){
                            selectedSubscription = "B"
                        }
                    }
                    .cornerRadius(16)
                    Text("As low as ¥22.5 / month")
                        .font(.subheadline)
                        .padding(.horizontal, 6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 2)
                }
            }
            .fontDesign(.rounded)
        }
        .padding(.horizontal)
    }
}

#Preview {
    Paywall_C_1()
}
