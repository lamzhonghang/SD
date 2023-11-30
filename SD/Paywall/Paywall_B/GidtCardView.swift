//
//  GidtCardView.swift
//  SD
//
//  Created by lan on 2023/10/27.
//

import SwiftUI
import CoreMotion

struct GidtCardPageView: View {
    @State private var selectedSubscription: String?
    @State private var toName: String
    @State private var fromName: String
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var motion = MotionManager()
    
    init() {
        _selectedSubscription = State(initialValue: "B")
        _toName = State(initialValue: "")
        _fromName = State(initialValue: "Baby Blue")
    }
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemGray5), .clear]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView{
                    VStack(alignment: .leading) {
                        FlippingView()
                            .hueRotation(.degrees(selectedSubscription == "B" ? 0 : -80))
                            .brightness((selectedSubscription == "B" ? 0.05 : 0.1))
                        //                        GidtCardView()
                        //                            .rotation3DEffect(.degrees(motion.x * 2), axis: (x: 0, y: 1, z: 0))
                        //                            .rotation3DEffect(.degrees(motion.y * 2 - 2), axis: (x: 1, y: 0, z: 0))
                        HStack{
                            Text(selectedSubscription == "B" ? "3 Years" : "1 Year")
                            Spacer()
                            Text("by \(fromName)")
                        }
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        .bold()
                        .padding(.top, 6)
                        .padding(.horizontal, 4)
                        .fontDesign(.rounded)
                    }
                    .padding(20)
                    .padding(.top, 30)
                    .background(
                        ZStack(alignment: .top){
                            RoundedRectangle(cornerRadius: 4)
                                .fill(colorScheme == .dark ? Color(UIColor.systemGray6) : Color(UIColor.systemBackground))
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.background)
                                .frame(width: 60, height:12)
                                .padding(24)
                                .blendMode(.destinationOut)
                            Circle()
                                .fill(.background)
                                .frame(width: 20, height:20)
                                .blendMode(.destinationOut)
                                .padding(16)
                        }
                            .compositingGroup()
                    )
                    .cornerRadius(4)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: motion.x * 2, y: motion.y * 2 )
                    .shadow(color: .black.opacity(0.3), radius: 1, x: motion.x * 1, y: motion.y * 1 )
                    .padding(.horizontal)
                    
                    VStack(spacing: 12){
                        Divider()
                            .padding(.bottom)
                        
                        VStack(spacing: 8){
                            Text("Choose a plan")
                                .bold()
                                .frame(maxWidth: .infinity, alignment:.leading)
                                .font(.subheadline)
                            fourSubscriptionsView(selectedSubscription: $selectedSubscription)
                        }
                        
                        VStack(spacing: 4){
                            Text("To")
                                .bold()
                                .frame(maxWidth: .infinity, alignment:.leading)
                            
                            TextField("Recipient Email...", text: $toName)
                                .padding()
                                .background(Color(UIColor.quaternarySystemFill))
                                .cornerRadius(8)
                                .frame(height: 56)
                        }
                        .font(.subheadline)
                        
                        VStack(spacing: 4){
                            Text("From")
                                .bold()
                                .frame(maxWidth: .infinity, alignment:.leading)
                            
                            TextField("Your Name...", text: $fromName)
                                .padding()
                                .background(Color(UIColor.quaternarySystemFill))
                                .cornerRadius(8)
                                .frame(height: 56)
                        }
                        .font(.subheadline)
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Gift Card")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom) {
                VStack{
                    Button{
                        //
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .tint(.white)
                            .padding()
                            .background(.red)
                            .fontWeight(.semibold)
                            .clipShape( RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .padding()
                    }
                }
                .background(.background)
                .shadow(color:Color(UIColor.separator), radius: 0, x:0, y: -0.33)
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        dismiss()
                    }label:{
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.secondary)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        //
                    }label:{
                       Text("Redeem")
                    }
                }
            }
        }
    }
}

struct FlippingView: View {
    @State private var flipped = false
    @State private var animate3d = false
    
    @State private var flipped2 = false
    @State private var animate3d2 = false
    
    var body: some View {
        
        return VStack {
            Spacer()
            ZStack() {
                GidtCardView().opacity(flipped ? 0.0 : 1.0)
                GidtCardBackView().opacity(flipped ? 1.0 : 0.0)
            }
            .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 1, y: 0)))
            .modifier(FlipEffect(flipped: $flipped2, angle: animate3d2 ? 15 : 0, axis: (x: 1, y: 0)))
            .onTapGesture {
                withAnimation(Animation.bouncy(duration: 0.4)) {
                    self.animate3d.toggle()
                }
            }
            Spacer()
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                withAnimation(.bouncy(duration: 0.6)) {
                    animate3d2 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                withAnimation(.bouncy(duration: 0.6)) {
                    animate3d2 = false
                }
            }
        }
    }
}

struct FlipEffect: GeometryEffect {
    
    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }
    
    @Binding var flipped: Bool
    var angle: Double
    let axis: (x: CGFloat, y: CGFloat)
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        
        DispatchQueue.main.async {
            self.flipped = self.angle >= 90 && self.angle < 270
        }
        
        let tweakedAngle = flipped ? -180 + angle : angle
        let a = CGFloat(Angle(degrees: tweakedAngle).radians)
        
        var transform3d = CATransform3DIdentity;
        transform3d.m34 = -0.4/max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, a, axis.x, axis.y, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))
        
        return ProjectionTransform(transform3d).concatenating(affineTransform)
    }
}

struct GidtCardView: View {
    @State private var startPoint: UnitPoint = .topLeading
    @State private var endPoint: UnitPoint = .bottomTrailing
    @StateObject private var motion = MotionManager()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Image("xmind_pro")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.4), radius: 0, x: motion.x - 0.5, y: motion.y - 0.5)
                }
                Spacer()
            }
            .padding(20)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0x6C69FF),Color(hex: 0xFF3737)]), startPoint: startPoint, endPoint: endPoint)
                    .blur(radius: 30, opaque: true)
                    .scaleEffect(1)
                    .offset(y: 10)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .shadow(color: .black.opacity(0.6), radius: 1, x: motion.x * 0.5, y: motion.y * 0.5)
                    .shadow(color: .black.opacity(0.2), radius: 4, x: motion.x * 4, y: motion.y * 4)
                    .shadow(color: .black.opacity(0.1), radius: 8, x: motion.x * 8, y: motion.y * 8)
                    .shadow(color: .black.opacity(0.05), radius: 16, x: motion.x * 16, y: motion.y * 16)
            )
            .frame(height: 200)
            .overlay{
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.white.opacity(0.2), .clear,.clear, .white.opacity(0.1), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .clipped()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: true)) {
                    startPoint = .bottomLeading
                    endPoint = .topTrailing
                }
            }
        }
    }
}

struct GidtCardBackView: View {
    @State private var startPoint: UnitPoint = .topLeading
    @State private var endPoint: UnitPoint = .bottomTrailing
    @StateObject private var motion = MotionManager()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment:.leading, spacing: 2){
            Text("Terms of sale")
                .bold()
            Text("1. eGift cards will be sent instantly via email after purchase. This does not include a physical card.")
            Text("2. eGift cards are non-exchangeable and non-returnable, please make sure the plan you choose and the recipient information are accurate.")
            Text("3. eGift cards can only be redeemed once, and the redemption period is within 12 months after purchase. Please redeem in a timely manner.")
            Text("4. XMind 8 is not included.")
            Text("5. One subscription allows you to connect up to 5 devices at same time include Macs / Pcs, iOS, and Android.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .font(.system(size: 10))
        .foregroundColor(.secondary)
        .padding(.horizontal)
        .background{
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(color: .black.opacity(0.3), radius: 1, x: motion.x * 0.5, y: motion.y * 0.5)
                .shadow(color: .black.opacity(0.1), radius: 4, x: motion.x * 4, y: motion.y * 4)
                .shadow(color: .black.opacity(0.1), radius: 8, x: motion.x * 8, y: motion.y * 8)
        }
        .frame(height: 200)
        .overlay{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1), .clear,.clear, .white.opacity(0.05), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipped()
        }
    }
}

struct fourSubscriptionsView: View{
    @Binding var selectedSubscription: String?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        HStack(alignment: .top, spacing: 8){
            HStack(spacing: 4){
                Text("1 Year")
                    .font(.subheadline)
                    .bold()
                Spacer()
                Text("$59.99")
                    .font(.caption2)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.quaternarySystemFill))
            .frame(height: 56)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(selectedSubscription == "A" ? Color.red : .clear, lineWidth: 4)
            )
            .onTapGesture {
                withAnimation(){
                    selectedSubscription = "A"
                }
            }
            .cornerRadius(8)
            VStack{
                ZStack(alignment: .topTrailing){
                    HStack(spacing: 4){
                        Text("3 Year")
                            .font(.subheadline)
                            .bold()
                        Spacer()
                        Text("$179.99")
                            .font(.caption2)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.quaternarySystemFill))
                    .background(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(selectedSubscription == "B" ? Color.red : .clear, lineWidth: 4)
                    )
                    .onTapGesture {
                        withAnimation(){
                            selectedSubscription = "B"
                        }
                    }
                    .cornerRadius(8)
                }
                .frame(height: 56)
            }
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    GidtCardPageView()
}

#Preview("Back"){
    GidtCardBackView()
}
