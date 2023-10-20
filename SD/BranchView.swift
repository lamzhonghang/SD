//
//  BranchView.swift
//  SD
//
//  Created by lan on 2023/10/19.
//

import SwiftUI

struct secondaryBracketView: View{
    @StateObject var dm = designModel()
    let namespace: Namespace.ID
    
    var body: some View{
        HStack(spacing: 0){
            Rectangle()
                .frame(width: 6 + dm.topicPadding / 3, height: 2)
            VStack(alignment: .leading, spacing: 0){
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: dm.topicRadius / 2))
                    .strokeBorder(lineWidth: 2)
                    .frame(width:8 + dm.topicPadding / 3, height:20)
                    .mask{
                        Rectangle()
                            .offset(x:-2, y:-2)
                    }
                    .offset(x: 0, y: 2)
                Rectangle()
                    .frame(width: 2)
                    .frame(height: 20 + dm.topicPadding * 4)
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: dm.topicRadius / 2))
                    .strokeBorder(lineWidth: 2)
                    .frame(width:8 + dm.topicPadding / 3, height: 24)
                    .mask{
                        Rectangle()
                            .offset(x:-2, y:2)
                    }
                    .offset(x: 0, y: -2)
            }
        }
        .gridCellUnsizedAxes([.horizontal,.vertical])
        .opacity(dm.branchOpacity)
    }
}

struct bracketView: View{
    @StateObject var dm = designModel()
    
    var body: some View{
        HStack(spacing: 0){
            Rectangle()
                .frame(width: 4 + dm.topicPadding / 3, height: 2)
            VStack(alignment: .leading, spacing: 0){
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: dm.topicRadius / 2))
                    .strokeBorder(lineWidth: 2)
                    .frame(width:8 + dm.topicPadding / 3, height:20)
                    .mask{
                        Rectangle()
                            .offset(x:-2, y:-2)
                    }
                    .offset(x: 0, y: 2)
                Rectangle()
                    .frame(width: 2)
                    .frame(height: 160 + dm.topicPadding * 12)
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: dm.topicRadius / 2))
                    .strokeBorder(lineWidth: 2)
                    .frame(width:8 + dm.topicPadding / 3, height:20)
                    .mask{
                        Rectangle()
                            .offset(x:-2, y:2)
                    }
                    .offset(x: 0, y: -2)
            }
        }
        .opacity(dm.branchOpacity)
        .gridCellUnsizedAxes([.horizontal,.vertical])
    }
}
