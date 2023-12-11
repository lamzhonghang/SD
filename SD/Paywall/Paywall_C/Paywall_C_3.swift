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
    @Environment(\.dismiss) private var dismiss
    @State private var isHighlight = false
    @State private var showTitle = false
    @State private var showGlow = false
    @State private var counter: Int = 0

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Button {
                        counter += 1
                    } label: {
                        if showTitle {
                            Image(systemName: "gift")
                                .font(.system(size: 37))
                                .foregroundStyle(Color.accentColor)
                                .transition(.scale(0.5).combined(with: .opacity))
                        }
                    }
                    .frame(height: 60)
                    .confettiCannon(counter: $counter, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200, repetitions: 1, repetitionInterval: 0.7)

                    Text("Up to 30% Off")
                        .foregroundStyle(Color.accentColor)
                        .font(.title2.bold())

                    HStack {
                        TimeUnitView(timeValue: hoursString(from: timeRemaining), timeUnit: "HOUR")
                        TwoDotView()
                        TimeUnitView(timeValue: minutesString(from: timeRemaining), timeUnit: "MIN")
                        TwoDotView()
                        TimeUnitView(timeValue: secondsString(from: timeRemaining), timeUnit: "SEC")
                    }
                    subscribeView()
                        .padding()
                        .frame(maxWidth: 380)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .font(.title3)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 8) {
                    Button {
                        //
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .tint(.white)
                            .padding()
                            .background(
                                Color.accentColor
                            )
                            .fontWeight(.semibold)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .padding(.horizontal)
                            .shadow(color: .red.opacity(0.1), radius: 12, x: 8, y: 8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .strokeBorder(
                                        LinearGradient(gradient: Gradient(colors: [.white.opacity(0.4), .white.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing),
                                        lineWidth: 1.5
                                    )
                                    .padding(.horizontal)
                            }
                            .scaleEffect(isHighlight ? 1.01 : 1)
                    }
                    .overlay {
                        GeometryReader { geometry in
                            LinearGradient(gradient: Gradient(colors: [.clear, .clear, .white.opacity(0.3), .clear, .clear, .white.opacity(0.1), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .offset(x: showGlow ? -geometry.size.width : geometry.size.width)
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        }
                        .padding(.horizontal)
                    }
                }
                .frame(maxWidth: 380)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.ultraThinMaterial)
            }
            .preferredColorScheme(.dark)
        }
        .onAppear {
            startTimer()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(dampingFraction: 0.6)) {
                    showTitle.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.easeInOut(duration: 1.8).repeatForever(autoreverses: false)) {
                    showGlow.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                withAnimation {
                    counter += 1
                }
            }
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                withAnimation(Animation.bouncy()) {
                    isHighlight.toggle()
                }
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
}

struct bannerView: View {
    var body: some View {
        Image(systemName: "gift")
    }
}

struct subscribeView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text("$19.99")
                    .font(.title)
                    .bold()
                Text("/ year")
                    .font(.body)
            }
            Text("$59.99")
                .font(.title3)
                .foregroundColor(.secondary)
                .strikethrough()
                .bold()
        }
        .padding(32)
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.quaternarySystemFill))
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.accentColor, lineWidth: 3)
        }
        .overlay(alignment: .top) {
            Text("Limited Time Exclusive Offer")
                .foregroundColor(.white)
                .padding(8)
                .padding(.horizontal, 8)
                .font(.subheadline)
                .bold()
                .frame(height: 32)
                .background(Capsule().fill(Color.accentColor))
                .offset(y: -16)
        }
    }
}

struct TimeUnitView: View {
    var timeValue: String
    var timeUnit: String

    var body: some View {
        VStack {
            Text(timeValue)
                .font(.system(size: 56))
                .contentTransition(.numericText())
                .monospacedDigit()
                .fontDesign(.rounded)
                .fontWeight(.heavy)
            Text(timeUnit)
                .font(.subheadline)
                .bold()
                .foregroundStyle(.tertiary)
        }
        .padding(4)
        .background(Color(UIColor.systemGray6))
    }
}

struct TwoDotView: View {
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .frame(width: 8)
            Circle()
                .frame(width: 8)
        }
        .padding(.vertical, 24)
    }
}

#Preview {
    Paywall_C_3()
}
