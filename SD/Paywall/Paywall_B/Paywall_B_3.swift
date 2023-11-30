//
//  Paywall_B_3.swift
//  SD
//
//  Created by lan on 2023/10/31.
//

import Charts
import SwiftUI

struct Paywall_B_3: View {
    @State private var selectedSubscription: String?
    @State private var selectIndex = 0
    @Environment(\.dismiss) private var dismiss

    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.label
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.label.withAlphaComponent(0.3)
        _selectedSubscription = State(initialValue: "B")
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color(UIColor.systemGray6)
                .frame(height: 200)
                .ignoresSafeArea(.all)

            TabView(selection: $selectIndex,
                    content: {
                        B3_Task()
                            .tag(0)
                        B3_numbering()
                            .tag(1)
                    })
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .overlay(alignment: .topTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.tertiary, .quinary.opacity(0.3))
                                .padding(.horizontal, 8)
                                .tint(.black)
                        }
                        .padding()
                    }
                    .safeAreaInset(edge: .bottom) {
                        VStack(spacing: 0) {
                            HStack {
                                Button {
                                    //
                                } label: {
                                    VStack(spacing: 2) {
                                        Text("Try Free & Subscribe")
                                            .font(.subheadline)
                                        Text(selectedSubscription == "B" ? "Charge after trial, 388.00/Year" : "Charge after trial, 38.00/Month")
                                            .font(.caption2)
                                            .foregroundStyle(.secondary)
                                            .bold()
                                    }
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .tint(.white)
                                    .padding(8)
                                    .frame(height: 54)
                                    .background(.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .background(.background)
                        .shadow(color: Color(UIColor.separator), radius: 0, x: 0, y: -0.33)
                        .shadow(color: Color(UIColor.systemBackground), radius: 12, x: 0, y: -16)
                    }
        }
    }
}

struct B3_SliderTextView: View {
    var title: String
    var caption: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .bold()
            Text(caption)
                .font(.subheadline)
            Spacer()
        }
        .padding()
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct skeletion: View {
    var body: some View {
        RoundedRectangle(cornerRadius: .infinity)
            .fill(.white.opacity(0.3))
            .frame(height: 20)
    }
}

struct B3_numbering: View {
    var body: some View {
        VStack(spacing: 0) {
            B3_numbering_image()
                .frame(height: 440)
            B3_SliderTextView(title: "Numbering", caption: "Experience the ease of auto-numbering for topics. Skip the time-consuming manual labeling and choose your preferred numbering style, enabling effortless organization of your thoughts.")
        }
    }
}

struct B3_numbering_image: View {
    @State private var show1 = false
    @State private var show2 = false
    @State private var show3 = false
    @State private var show4 = false

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                if show1 {
                    Text("1.")
                        .font(.title3)
                        .bold()
                        .transition(.scale(0.3).combined(with: .opacity))
                }
                skeletion()
            }
            .padding(20)
            .background(Color(UIColor.systemGray5))
            .cornerRadius(12)
            VStack {
                HStack(spacing: 16) {
                    if show2 {
                        Text("1.1")
                            .font(.title3)
                            .bold()
                    }
                    skeletion()
                }
                .padding(20)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(12)
                HStack(spacing: 16) {
                    if show3 {
                        Text("1.2")
                            .font(.title3)
                            .bold()
                    }
                    skeletion()
                }
                .padding(20)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(12)
                HStack(spacing: 16) {
                    if show4 {
                        Text("1.3")
                            .font(.title3)
                            .bold()
                    }
                    skeletion()
                }
                .padding(20)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(12)
            }
            .padding(.leading, 20)
        }
        .frame(width: UIScreen.screenWidth / 3 * 2)
        .frame(maxWidth: 400)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Rectangle()
                .fill(Color(UIColor.systemGray6))
                .ignoresSafeArea(.all)
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.bouncy) {
                    self.show1 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.bouncy) {
                    self.show2 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation(.bouncy) {
                    self.show3 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.bouncy) {
                    self.show4 = true
                }
            }
        }
    }
}

struct B3_image: View {
    @State private var check1 = true
    @State private var check2 = false
    @State private var check3 = false

    var checkedCount: Int {
        [check1, check2, check3].filter { $0 }.count
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .stroke(.black, lineWidth: 2)

                        if check1 && check2 && check3 {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .transition(.scale(0.6).combined(with: .opacity).animation(.bouncy.delay(0.3).speed(2)))
                        } else {
                            PieChartView(checkedCount: checkedCount)
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 19, height: 19)
                                .fixedSize()
                                .rotationEffect(.degrees(-90))
                        }
                    }
                    .frame(width: 24)
                    skeletion()
                }
                .padding(20)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(12)

                VStack {
                    HStack(spacing: 16) {
                        InteractiveView(isChecked: $check1)
                        skeletion()
                    }
                    .padding(20)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(12)

                    HStack(spacing: 16) {
                        InteractiveView(isChecked: $check2)
                        skeletion()
                    }
                    .padding(20)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(12)

                    HStack(spacing: 16) {
                        InteractiveView(isChecked: $check3)
                        skeletion()
                    }
                    .padding(20)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(12)
                }
                .padding(.leading, 24)
                Spacer()
            }
            .frame(width: UIScreen.screenWidth / 3 * 2)
            .frame(maxWidth: 400)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Rectangle()
                .fill(Color(UIColor.systemGray6))
                .ignoresSafeArea(.all)
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                withAnimation(.easeInOut) {
                    check2 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut) {
                    check3 = true
                }
            }
        }
    }
}

struct B3_Task: View {
    var body: some View {
        VStack(spacing: 0) {
            B3_image()
                .frame(height: 440)
            B3_SliderTextView(title: "Task Tracking", caption: "Easily manage your tasks in mind maps")
        }
    }
}

struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
}

struct InteractiveView: View {
    @Binding var isChecked: Bool
    @State private var isScaled = false

    var body: some View {
        VStack {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .font(.system(size: 24))
                .fontWeight(.medium)
                .opacity(isChecked ? 1 : 0.7)
                .scaleEffect(isScaled ? 1.3 : 1.0)
                .sensoryFeedback(.decrease, trigger: isChecked)
                .onTapGesture {
                    withAnimation(.easeInOut.speed(2)) {
                        self.isChecked.toggle()
                        self.isScaled = true
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut.speed(2)) {
                            self.isScaled = false
                        }
                    }
                }
        }
    }
}

struct PieChartView: View {
    var checkedCount: Int
    var endAngle: Double {
        Double(checkedCount) * 360.0 / 3.0
    }

    var body: some View {
        GeometryReader { _ in
            Circle()
                .foregroundColor(Color.clear)
                .modifier(PieSliceAnimation(endAngle: endAngle))
        }
        .aspectRatio(1, contentMode: .fit)
        .frame(width: 20, height: 20)
    }
}

struct PieSliceAnimation: AnimatableModifier {
    var endAngle: Double
    var animatableData: Double {
        get { endAngle }
        set { endAngle = newValue }
    }

    func body(content: Content) -> some View {
        content.overlay(
            PieSlice(endAngle: endAngle)
        )
    }
}

struct PieSlice: Shape {
    let endAngle: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: endAngle), clockwise: false)
        path.closeSubpath()
        return path
    }
}

#Preview {
    Paywall_B_3()
}
