//
//  MemberCard.swift
//  SD
//
//  Created by lan on 2023/10/29.
//

import SwiftUI
import CoreMotion

struct MemberCard: View {
    @StateObject private var motion = MotionManager()
    let date = Date()
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color(hex: 0x6C69FF),Color(hex: 0xFF3737)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .shadow(color: .blue.opacity(0.9), radius: motion.x <= 0.1 ? 0 : 20, x: motion.x, y: motion.y)
            
            VStack(alignment: .leading,spacing: 6){
                Text("Baby Blue")
                    .fontWeight(.black)
                Text("\(motion.x)")
                Text("since \(date.formatted(date:.abbreviated, time: .omitted))")
                    .fontDesign(.monospaced)
                    .font(.footnote)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight:.infinity)
            //            .background(Color(UIColor.secondarySystemBackground))
            .background(.background)
            .cornerRadius(12)
            .rotation3DEffect(.degrees(motion.x * 12), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(motion.y * 12 - 12), axis: (x: -1, y: 0, z: 0))
            
            //            .backgroundStyle(
            //                .blue.gradient.shadow(
            //                    .inner(color: .black, radius: 10, x: motion.x * -20, y: motion.y * -20)
            //                )
            //            )
        }
        .padding(50)
        .padding(.vertical, 100)
    }
}

#Preview("card") {
    MemberCard()
}
