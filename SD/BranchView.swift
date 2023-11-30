//
//  BranchView.swift
//  SD
//
//  Created by lan on 2023/10/19.
//

import SwiftUI

struct secondaryBracketView: View {
    @ObservedObject var dm = designModel()
    let namespace: Namespace.ID

    var width: CGFloat {
        dm.branchWidth + dm.topicRadius
    }

    var height: CGFloat {
        dm.SubTopicHeight * 3 + dm.gridVerSpacing * 2
    }

    var y: CGFloat {
        if dm.branchCenterToTopic {
            dm.SubTopicHeight / 2
        } else {
            0
        }
    }

    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: dm.branchWidth, height: dm.branchStroke)
            VStack {
                branch()
//                branch()
//                    .scaleEffect(x: 1, y: -1, anchor: .center)
            }
            .frame(width: width)
            .scaleEffect(x: -1, y: 1, anchor: .center)
        }
//        .gridCellUnsizedAxes([.horizontal, .vertical])
        .opacity(dm.branchOpacity)
    }

    @ViewBuilder
    func branch() -> some View {
        VStack {
            BranchShape(dm: dm, y: y)
                .stroke(Color.black, lineWidth: dm.branchStroke)
        }
    }
}

struct bracketView: View {
    @ObservedObject var dm = designModel()

    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 4 + dm.topicPadding / 3, height: 2)
            VStack(alignment: .leading, spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: dm.topicRadius / 2))
                    .strokeBorder(lineWidth: 2)
                    .frame(width: 8 + dm.topicPadding / 3, height: 20)
                    .mask {
                        Rectangle()
                            .offset(x: -2, y: -2)
                    }
                    .offset(x: 0, y: 2)
                Rectangle()
                    .frame(width: 2)
                    .frame(height: 160 + dm.topicPadding * 12)
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: dm.topicRadius / 2))
                    .strokeBorder(lineWidth: 2)
                    .frame(width: 8 + dm.topicPadding / 3, height: 20)
                    .mask {
                        Rectangle()
                            .offset(x: -2, y: 2)
                    }
                    .offset(x: 0, y: -2)
            }
        }
        .opacity(dm.branchOpacity)
        .gridCellUnsizedAxes([.horizontal, .vertical])
    }
}

struct BranchShape: Shape {
    @StateObject var dm = designModel()
    var y: CGFloat

    var animatableData: CGFloat {
        get { y }
        set { y = newValue }
    }

    var width: CGFloat {
        dm.branchWidth + dm.topicRadius
    }

    var height: CGFloat {
        dm.SubTopicHeight * 3 + dm.gridVerSpacing * 2
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: dm.branchWidth, y: y))
        path.addArc(tangent1End: CGPoint(x: width, y: y), tangent2End: CGPoint(x: width, y: dm.topicRadius + y), radius: dm.topicRadius)
        path.addLine(to: CGPoint(x: width, y: height / 2))
        return path
    }
}

//            VStack(alignment: .leading, spacing: 0) {
//                UnevenRoundedRectangle(cornerRadii: .init(topLeading: dm.topicRadius / 2))
//                    .strokeBorder(lineWidth: dm.branchStroke)
//                    .frame(width: dm.branchWidth + dm.branchStroke, height: dm.branchWidth)
//                    .mask {
//                        Rectangle()
//                            .offset(x: -dm.branchStroke - 1, y: -dm.branchStroke - 1)
//                    }
//                    .offset(x: 0, y: dm.branchStroke + 2)
//                Rectangle()
//                    .frame(width: dm.branchStroke)
//                    .frame(height: dm.SubTopicHeight * 2 + dm.gridVerSpacing * 2 - dm.branchWidth * 2 + dm.branchStroke * 2)
//                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: dm.topicRadius / 2))
//                    .strokeBorder(lineWidth: dm.branchStroke)
//                    .frame(width: dm.branchWidth, height: dm.branchWidth)
//                    .mask {
//                        Rectangle()
//                            .offset(x: -dm.branchStroke - 1, y: dm.branchStroke + 1)
//                    }
//                    .offset(x: 0, y: -dm.branchStroke - 2)
//            }
