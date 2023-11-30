//
//  GridView.swift
//  SD
//
//  Created by lan on 2023/10/19.
//

import SwiftUI

struct EditableTextField: View {
    @State private var isEditing = false
    @Binding var text: String

    var body: some View {
        TextField("", text: $text)
//            .disabled(!isEditing)
            .onTapGesture(count: 2) {
                isEditing = true
            }
            .onSubmit {
                isEditing = false
            }
    }
}

struct GridView: View {
    @State private var sd = SDData()
    @StateObject var dm = designModel()
    let namespace: Namespace.ID

    var body: some View {
        HStack {
            Text(sd.sdCenter)
                .centralTopic(dm: dm)
                .matchedGeometryEffect(id: "center", in: namespace)
            if dm.isBranch {
                bracketView(dm: dm)
            }
            VStack {
                ForEach(1 ... 3, id: \.self) { number in
                    HStack {
                        Text("Main topic \(number)")
                            .mainTopic(dm: dm)
                            .matchedGeometryEffect(id: "Main\(number)", in: namespace)
                        if dm.isBranch {
                            secondaryBracketView(dm: dm, namespace: namespace)
                                .matchedGeometryEffect(id: "branchCenter\(number)", in: namespace)
                        }
                        VStack {
                            ForEach(1 ... 3, id: \.self) { number in
                                Text("Subtopic \(number)")
                                    .matchedGeometryEffect(id: "Sub2_\(number)", in: namespace)
                                    .subTopic(dm: dm)
                                    .modifier(GetHeightModifier(height: $dm.SubTopicHeight))
                            }
                        }
                    }
                }
            }
        }
    }
}

// #Preview {
//    GridView()
// }
