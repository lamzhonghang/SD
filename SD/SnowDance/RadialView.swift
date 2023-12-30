//
//  RadialView.swift
//  SD
//
//  Created by lan on 2023/10/20.
//

import SwiftUI

struct RadialView: View {
    @State private var sd = SDData()
    @StateObject var dm = designModel()
    let namespace: Namespace.ID
    
    var body: some View {
        ZStack{
            WheelLayout(radius: 250.0, rotation: .zero) {
                WheelLayout(radius: 80.0, rotation: .degrees(180)) {
                    Text(sd.sdMain1)
                        .mainTopic(dm: dm)
                        .matchedGeometryEffect(id: "Main1", in: namespace)
                    Text(sd.sdSub1_1)
                        .subTopic(dm: dm)
                        .matchedGeometryEffect(id: "Sub1_1", in: namespace)
                    Text(sd.sdSub1_2)
                        .subTopic(dm: dm)
                        .matchedGeometryEffect(id: "Sub1_2", in: namespace)
                }
                WheelLayout(radius: 90.0, rotation: .degrees(-60)) {
                    Text(sd.sdMain2)
                        .mainTopic(dm: dm)
                        .matchedGeometryEffect(id: "Main2", in: namespace)
                    Text(sd.sdSub1_1)
                        .subTopic(dm: dm)
                        .matchedGeometryEffect(id: "Sub2_1", in: namespace)
                    Text(sd.sdSub1_2)
                        .subTopic(dm: dm)
                        .matchedGeometryEffect(id: "Sub2_2", in: namespace)
                    Text(sd.sdSub1_3)
                        .subTopic(dm: dm)
                        .matchedGeometryEffect(id: "Sub2_3", in: namespace)
                }
                WheelLayout(radius: 90.0, rotation: .degrees(60)) {
                    Text(sd.sdMain3)
                        .mainTopic(dm: dm)
                        .matchedGeometryEffect(id: "Main3", in: namespace)
                    Text(sd.sdSub1_1)
                        .subTopic(dm: dm)
                        .matchedGeometryEffect(id: "Sub3_1", in: namespace)
                    Text(sd.sdSub1_2)
                        .subTopic(dm: dm)
                        .matchedGeometryEffect(id: "Sub3_2", in: namespace)
                    Text(sd.sdSub1_3)
                        .subTopic(dm: dm)
                        .matchedGeometryEffect(id: "Sub3_3", in: namespace)
                }
            }
            Text(sd.sdCenter)
                .centralTopic(dm: dm)
                .matchedGeometryEffect(id: "center", in: namespace)
                .padding(.bottom, 16)
        }
    }
}

struct WheelLayout: Layout {
    var radius: CGFloat
    var rotation: Angle
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxSize = subviews.map { $0.sizeThatFits(proposal) }.reduce(CGSize.zero) {
            return CGSize(width: max($0.width, $1.width), height: max($0.height, $1.height))
        }
        return CGSize(width: (maxSize.width / 2 + radius) * 2,
                      height: (maxSize.height / 2 + radius) * 2)
    }
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ())
    {
        let angleStep = (Angle.degrees(360).radians / Double(subviews.count))
        for (index, subview) in subviews.enumerated() {
            let angle = angleStep * CGFloat(index) + rotation.radians
            
            // Find a vector with an appropriate size and rotation.
            var point = CGPoint(x: 0, y: -radius).applying(CGAffineTransform(rotationAngle: angle))
            
            // Shift the vector to the middle of the region.
            point.x += bounds.midX
            point.y += bounds.midY
            
            // Place the subview.
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}

//#Preview {
//    RadialView()
//}
