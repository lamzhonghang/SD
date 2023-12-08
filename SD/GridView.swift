//
//  GridView.swift
//  SD
//
//  Created by lan on 2023/10/19.
//

import SwiftUI

struct GridView: View {
    @State private var sd = SDData()
    @StateObject var dm = designModel()
    let namespace: Namespace.ID

    var body: some View {
        HStack(spacing: dm.gridHorSpacing) {
            Text(sd.sdCenter)
                .centralTopic(dm: dm)
                .matchedGeometryEffect(id: "center", in: namespace)
            if dm.isBranch {
                bracketView(dm: dm)
                    .opacity(dm.branchOpacity)
            }
            VStack(spacing: dm.gridVerSpacing) {
                ForEach(1 ... 3, id: \.self) { number2 in
                    HStack(spacing: dm.gridHorSpacing) {
                        Text("Main topic \(number2)")
                            .mainTopic(dm: dm)
                            .matchedGeometryEffect(id: "Main\(number2)", in: namespace)
                            .overlay {
                                RoundedRectangle(cornerRadius: dm.topicRadius + 4)
                                    .opacity(0.01)
                                    .padding(4)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: dm.topicRadius)
                                            .stroke(dm.selectedTopicIndex == number2 ? Color.blue : Color.clear, lineWidth: 2)
                                    }
                            }
                            .onTapGesture {
                                withAnimation {
                                    dm.selectedTopicIndex = number2
                                }
                            }
                        if dm.isBranch {
                            secondaryBracketView(dm: dm)
                                .matchedGeometryEffect(id: "branchCenter\(number2)", in: namespace)
                                .opacity(dm.branchOpacity)
                        }
                        VStack(spacing: dm.gridVerSpacing) {
                            ForEach(1 ... 3, id: \.self) { number in
                                Text("Subtopic \(number)")
                                    .matchedGeometryEffect(id: "Sub\(number2)_\(number)", in: namespace)
                                    .subTopic(dm: dm)
                                    .modifier(GetHeightModifier(height: $dm.SubTopicHeight))
                            }
                        }
                    }
                }
            }
        }
        .onTapGesture {
            withAnimation {
                dm.selectedTopicIndex = nil
            }
        }
    }
}

// #Preview {
//    GridView()
// }
