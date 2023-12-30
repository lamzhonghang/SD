//
//  Paywall_C_3.swift
//  SD
//
//  Created by lan on 2023/12/9.
//

import ConfettiSwiftUI
import SwiftUI

struct Paywall_C_3: View {
    @State private var timeRemaining = 24 * 60 * 60
    @State private var isHighlight = false
    @State private var showGift = false
    @State private var showGlow = false
    @State private var counter: Int = 0
    @Environment(\.verticalSizeClass) private var verSizeClass
    var phoneIsLandscape: Bool {
        verSizeClass == .regular
    }

    var body: some View {
        NavigationStack {
            ZStack {
                BGView()
                ScrollView(showsIndicators: false) {
                    if phoneIsLandscape {
                        VStack(spacing: 0) {
                            TitleAreaView()
                            CountDownAndIconView()
                            Spacer()
                        }
                        .padding(.top, 48)
                        .padding()
                        .frame(maxWidth: .infinity)
                    } else {
                        HStack(spacing: 32) {
                            TitleAreaView()
                            CountDownAndIconView()
                        }
                        .padding()
                        .padding(.vertical)
                    }
                }
                .safeAreaInset(edge: .bottom, content: {
                    CTAAreaView()
                })
            }
        }
        .overlay(alignment: .top) {
            xmarkBarView()
        }
        .preferredColorScheme(.dark)
        .onAppear {
            startTimer()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    showGift.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                counter += 1
            }
        }
    }

    func startTimer() {
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

    @ViewBuilder
    func TitleAreaView() -> some View {
        let gradient = LinearGradient(colors: [.black, .black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
        VStack(spacing: 4) {
            if showGift {
                Button {
                    counter += 1
                } label: {
                    Image(systemName: "gift")
                        .font(.title)
                        .padding(.vertical, 12)
                        .foregroundColor(.white)
                        .mask {
                            gradient
                        }
                }
                .transition(.scale(scale: 0.2).combined(with: .opacity))
                .confettiCannon(counter: $counter, num: 100, openingAngle: Angle(degrees: 20), closingAngle: Angle(degrees: 360), radius: 200)
            }
            Text("Limited Time Exclusive Offer")
                .font(.body)
                .mask {
                    gradient
                }
            Text("Up to 30% Off")
                .font(.largeTitle.bold())
                .mask {
                    gradient
                }
        }
        .opacity(0.9)
    }

    @ViewBuilder
    func CountDownAndIconView() -> some View {
        VStack {
            HStack(spacing: 12) {
                TimeUnitView(timeValue: hoursString(from: timeRemaining))
                TwoDotView()
                TimeUnitView(timeValue: minutesString(from: timeRemaining))
                TwoDotView()
                TimeUnitView(timeValue: secondsString(from: timeRemaining))
            }
            .padding(.top, 16)
            HStack(alignment: .bottom, spacing: 12) {
                Image("17_anniversary_icon")
                    .resizable()
                    .scaledToFit()
                Image("appstore_today_icon")
                    .resizable()
                    .scaledToFit()
                Image("100_downloads_icon")
                    .resizable()
                    .scaledToFit()
            }
            .padding(8)
            .padding(.vertical, phoneIsLandscape ? 16 : 0)
            .opacity(0.4)
            .frame(maxWidth: 380)
        }
    }
}

struct BGView: View {
    @State private var animation = false
    var body: some View {
        Color(hex: 0x050320)
            .ignoresSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                GradientColorView()
            }
            .overlay {
                Image("noise")
                    .resizable()
                    .scaledToFill()
                    .blendMode(.multiply)
                    .scaleEffect(1.15)
                    .opacity(0.7)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(Animation.timingCurve(0.7, 0, 0.25, 1, duration: 8).repeatForever(autoreverses: true)) {
                        animation.toggle()
                    }
                }
            }
    }

    @ViewBuilder
    func GradientColorView() -> some View {
        ZStack {
            // Blue
            Ellipse()
                .frame(width: animation ? 100 : 174, height: animation ? 458 : 538)
                .foregroundColor(Color(hex: 0x6C69FF))
                .offset(x: animation ? 0 : -100)
                .offset(y: animation ? 100 : 200)
            // Red
            Ellipse()
                .frame(width: animation ? 130 : 230, height: 268)
                .foregroundColor(Color(hex: 0xFF3737))
                .offset(x: animation ? 200 : 0)
                .offset(y: animation ? 100 : 0)
            // Green
            Ellipse()
                .frame(width: animation ? 100 : 174, height: 268)
                .offset(y: -100)
                .offset(x: animation ? 100 : 150)
                .opacity(animation ? 0.8 : 0.5)
                .foregroundColor(Color(hex: 0x76FF84))
        }
        .blur(radius: 100)
        .scaleEffect(animation ? 1.8 : 1.3)
        .offset(y: -100)
        .offset(x: animation ? -20 : 0)
    }
}

struct xmarkBarView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        HStack {
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.large)
                    .font(.title3)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}

struct TimeUnitView: View {
    var timeValue: String
    @Environment(\.verticalSizeClass) private var verSizeClass
    var phoneIsLandscape: Bool {
        verSizeClass == .regular
    }

    var body: some View {
        VStack {
            Text(timeValue)
                .font(.system(size: phoneIsLandscape ? 44 : 24))
                .contentTransition(.numericText())
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .opacity(0.9)
                .mask {
                    LinearGradient(colors: [.black, .black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                }
        }
        .padding()
        .padding(.vertical, 8)
        .background(.black.opacity(0.2))
        .cornerRadius(12)
    }
}

struct TwoDotView: View {
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .frame(width: 8)
                .background(.ultraThinMaterial)
            Circle()
                .frame(width: 8)
                .background(.ultraThinMaterial)
        }
    }
}

struct CTAAreaView: View {
    @Environment(\.verticalSizeClass) private var verSizeClass
    var phoneIsLandscape: Bool {
        verSizeClass == .regular
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if phoneIsLandscape {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("First Year Only $41.99")
                            .font(.title3.bold())
                        Text("Then,")
                            .foregroundStyle(.secondary)
                            +
                            Text(" $59.99/year ")
                            .foregroundStyle(.white)
                            +
                            Text("subscription can be cancelled on App Store anytime.")
                            .foregroundStyle(.secondary)
                    }
                    .font(.subheadline)
                } else {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("First Year Only $41.99, ")
                            .foregroundStyle(.white)
                            +
                            Text("and then $59.99/year subscription can be cancelled on App Store anytime.")
                    }
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
            Button {
                //
            } label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .tint(.black)
                    .padding()
                    .background(
                        Color.white
                    )
                    .fontWeight(.semibold)
                    .cornerRadius(12)
                    .compositingGroup()
                    .shadow(radius: 30)
            }
            if phoneIsLandscape {
                HStack {
                    Button {
                        //
                    } label: {
                        Text("Terms & Policy")
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        Text("Restore")
                    }
                }
                .font(.subheadline)
                .padding(.vertical, 12)
                .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: 380)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .compositingGroup()
        .shadow(radius: 30)
    }
}

#Preview {
    Paywall_C_3()
}
