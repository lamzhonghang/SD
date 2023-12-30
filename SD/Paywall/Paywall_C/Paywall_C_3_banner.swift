//
//  Paywall_C_3_banner.swift
//  SD
//
//  Created by lan on 2023/12/13.
//

import SwiftUI

struct Paywall_C_3_banner: View {
    @State private var timeRemaining = 24 * 60 * 60
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color(hex: 0x050320)
                .overlay {
                    HStack {
                        Ellipse()
                            .frame(width: 174, height: 238)
                            .foregroundColor(Color(hex: 0x6C69FF))
                        Ellipse()
                            .frame(width: 130, height: 268)
                            .foregroundColor(Color(hex: 0xFF3737))
                    }
                    .blur(radius: 60)
                    .scaleEffect(1.6)
                }
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Limited Time Offer")
                        .font(.footnote)
                    Text("Up to 30% Off")
                        .font(.subheadline.bold())
                        .layoutPriority(1)
                }
                .minimumScaleFactor(0.8)
                Spacer()
                HStack(spacing: 6) {
                    TimeUnitView_setting(timeValue: hoursString(from: timeRemaining))
                    TimeUnitView_setting(timeValue: minutesString(from: timeRemaining))
                    TimeUnitView_setting(timeValue: secondsString(from: timeRemaining))
                }
                .layoutPriority(1)
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(height: 76)
        .cornerRadius(12)
        .padding()
        .overlay(alignment: .topTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.footnote)
                    .frame(width: 24,height: 24)
                    .background(.regularMaterial, in: Circle())
                    .environment(\.colorScheme, .dark)
                    .foregroundColor(.secondary)
                    .offset(x: -6, y: 6)
            }
        }
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .onAppear {
            startTimer()
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

struct TimeUnitView_setting: View {
    var timeValue: String
    var body: some View {
        Text(timeValue)
            .font(.system(size: 24))
            .fontWeight(.bold)
            .minimumScaleFactor(0.6)
            .padding(12)
            .background(.black.opacity(0.2))
            .cornerRadius(8)
    }
}

#Preview {
    Paywall_C_3_banner()
}
