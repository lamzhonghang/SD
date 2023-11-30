//
//  MemberCard.swift
//  SD
//
//  Created by lan on 2023/10/29.
//

import CoreMotion
import SwiftUI

struct MemberCard: View {
    @StateObject private var motion = MotionManager()
    @Environment(\.dismiss) private var dismiss
    
    let date = Date()
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color(hex: 0xFF3737), Color(hex: 0xFF3737)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .shadow(color: Color(hex: 0xFF3737).opacity(0.9), radius: fabs(motion.x) <= 0.1 ? 0 : 2, x: motion.x * 2, y: motion.y * 2)
                    .shadow(color: Color(hex: 0xFF3737).opacity(0.6), radius: fabs(motion.x) <= 0.1 ? 0 : 6, x: motion.x * 6, y: motion.y * 6)
                    .shadow(color: Color(hex: 0xFF3737).opacity(0.3), radius: fabs(motion.x) <= 0.1 ? 0 : 12, x: motion.x * 12, y: motion.y * 12)
                    .shadow(color: Color(hex: 0xFF3737).opacity(0.2), radius: fabs(motion.x) <= 0.1 ? 0 : 24, x: motion.x * 24, y: motion.y * 24)
                    .scaleEffect(0.9)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Baby Blue")
                        .fontWeight(.black)
                    Text("\(motion.x)")
                    Text("since \(date.formatted(date: .abbreviated, time: .omitted))")
                        .fontDesign(.monospaced)
                        .font(.footnote)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.background)
                .cornerRadius(12)
                .rotation3DEffect(.degrees(motion.x * 82), axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(.degrees(motion.y * 42 - 42), axis: (x: -1, y: 0, z: 0))
            }
            .padding(50)
            .padding(.vertical, 100)
            .drawingGroup()
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview("card") {
    MemberCard()
}
