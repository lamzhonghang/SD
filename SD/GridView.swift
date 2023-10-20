//
//  GridView.swift
//  SD
//
//  Created by lan on 2023/10/19.
//

import SwiftUI

struct GridView: View{
    @State private var sd = SDData()
    @StateObject var dm = designModel()
    let namespace: Namespace.ID
    
    var body: some View{
        VStack{
            Spacer()
            Grid(horizontalSpacing: dm.gridHorSpacing, verticalSpacing: dm.gridVerSpacing){
                GridRow{
                    Text(sd.sdCenter)
                        .centralTopic(dm: dm)
                        .matchedGeometryEffect(id: "center", in: namespace)
                    if dm.isBranch{
                        bracketView(dm:dm)
                    }
                    Grid(horizontalSpacing: dm.gridHorSpacing, verticalSpacing: dm.gridVerSpacing){
                        GridRow{
                            HStack{
                                Text(sd.sdMain1)
                                    .mainTopic(dm: dm)
                                    .matchedGeometryEffect(id: "Main1", in: namespace)
                                if dm.isBranch{
                                    secondaryBracketView(dm:dm, namespace: namespace)
                                        .matchedGeometryEffect(id: "branchCenter1", in: namespace)
                                }
                            }
                            Grid(horizontalSpacing: dm.gridHorSpacing, verticalSpacing: dm.gridVerSpacing){
                                GridRow{
                                    Text(sd.sdSub1_1)
                                        .subTopic(dm: dm)
                                        .matchedGeometryEffect(id: "Sub1_1", in: namespace)
                                }
                                GridRow{
                                    Text(sd.sdSub1_2)
                                        .subTopic(dm: dm)
                                        .matchedGeometryEffect(id: "Sub1_2", in: namespace)
                                }
                            }
                        }
                        GridRow{
                            HStack{
                                Text(sd.sdMain2)
                                    .mainTopic(dm: dm)
                                    .matchedGeometryEffect(id: "Main2", in: namespace)
                                if dm.isBranch{
                                    secondaryBracketView(dm:dm, namespace: namespace)
                                        .matchedGeometryEffect(id: "branchCenter2", in: namespace)
                                }
                            }
                            Grid(horizontalSpacing: dm.gridHorSpacing, verticalSpacing: dm.gridVerSpacing){
                                
                                GridRow{
                                    Text(sd.sdSub1_1)
                                        .subTopic(dm: dm)
                                        .matchedGeometryEffect(id: "Sub2_1", in: namespace)
                                }
                                GridRow{
                                    Text(sd.sdSub1_2)
                                        .subTopic(dm: dm)
                                        .matchedGeometryEffect(id: "Sub2_2", in: namespace)
                                }
                                GridRow{
                                    Text(sd.sdSub1_3)
                                        .subTopic(dm: dm)
                                        .matchedGeometryEffect(id: "Sub2_3", in: namespace)
                                }
                            }
                        }
                        GridRow{
                            HStack{
                                Text(sd.sdMain3)
                                    .mainTopic(dm: dm)
                                    .matchedGeometryEffect(id: "Main3", in: namespace)
                                if dm.isBranch{
                                    secondaryBracketView(dm:dm, namespace: namespace)
                                        .matchedGeometryEffect(id: "branchCenter3", in: namespace)
                                }
                            }
                            Grid(horizontalSpacing: dm.gridHorSpacing, verticalSpacing: dm.gridVerSpacing){
                                GridRow{
                                    Text(sd.sdSub1_1)
                                        .subTopic(dm: dm)
                                        .matchedGeometryEffect(id: "Sub3_1", in: namespace)
                                }
                                GridRow{
                                    Text(sd.sdSub1_2)
                                        .subTopic(dm: dm)
                                        .matchedGeometryEffect(id: "Sub3_2", in: namespace)
                                }
                                GridRow{
                                    Text(sd.sdSub1_3)
                                        .subTopic(dm: dm)
                                        .matchedGeometryEffect(id: "Sub3_3", in: namespace)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: 1000)
           
            Spacer()
        }
    }
}

//#Preview {
//    GridView()
//}
