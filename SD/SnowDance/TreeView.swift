//
//  TreeView.swift
//  SD
//
//  Created by lan on 2023/10/19.
//

import SwiftUI

struct TreeView: View{
    @State private var sd = SDData()
    @StateObject var dm = designModel()
    let namespace: Namespace.ID
    
    var body: some View{
        VStack(alignment: .leading){
            Text(sd.sdCenter)
                .centralTopic(dm: dm)
                .matchedGeometryEffect(id: "center", in: namespace)
                .frame(alignment: .leading)
            Group{
                Text(sd.sdMain1)
                    .mainTopic(dm: dm)
                    .matchedGeometryEffect(id: "Main1", in: namespace)
                VStack{
                    Text(sd.sdSub1_1)
                        .matchedGeometryEffect(id: "Sub1_1", in: namespace)
                        .subTopic(dm: dm)
                    Text(sd.sdSub1_2)
                        .matchedGeometryEffect(id: "Sub1_2", in: namespace)
                        .subTopic(dm: dm)
                }
            }
            
            Text(sd.sdMain2)
                .mainTopic(dm: dm)
                .matchedGeometryEffect(id: "Main2", in: namespace)
            VStack{
                Text(sd.sdSub1_1)
                    .matchedGeometryEffect(id: "Sub2_1", in: namespace)
                    .subTopic(dm: dm)
                Text(sd.sdSub1_2)
                    .subTopic(dm: dm)
                    .matchedGeometryEffect(id: "Sub2_2", in: namespace)
                Text(sd.sdSub1_3)
                    .subTopic(dm: dm)
                    .matchedGeometryEffect(id: "Sub2_3", in: namespace)
            }
            Text(sd.sdMain3)
                .mainTopic(dm: dm)
                .matchedGeometryEffect(id: "Main3", in: namespace)
            VStack{
                Text(sd.sdSub1_1)
                    .matchedGeometryEffect(id: "Sub3_1", in: namespace)
                    .subTopic(dm: dm)
                Text(sd.sdSub1_2)
                    .matchedGeometryEffect(id: "Sub3_2", in: namespace)
                    .subTopic(dm: dm)
                Text(sd.sdSub1_3)
                    .matchedGeometryEffect(id: "Sub3_3", in: namespace)
                    .subTopic(dm: dm)
            }
        }
        .frame(maxWidth: dm.topicMaxWidth)
    }
}

//#Preview {
//    TreeView()
//}
