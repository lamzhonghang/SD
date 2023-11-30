//
//  BranchView.swift
//  SD
//
//  Created by lan on 2023/10/19.
//

import SwiftUI

struct secondaryBracketView: View {
    @StateObject var dm = designModel()

    var width: CGFloat {
        dm.branchWidth + dm.branchsRadius
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
            BranchShapeBar(dm: dm)
                .stroke(Color.black, style: StrokeStyle(
                    lineWidth: dm.branchStroke,
                    lineCap: .round
                ))
                .frame(width: dm.branchWidth, height: dm.branchStroke)

            VStack {
                branch()
                branch()
                    .scaleEffect(x: 1, y: -1, anchor: .center)
            }
            .frame(width: width, height: height)
            .scaleEffect(x: -1, y: 1, anchor: .center)
        }
    }

    @ViewBuilder
    func branch() -> some View {
        VStack {
            BranchShape(dm: dm, y: y)
                .stroke(Color.black, style: StrokeStyle(
                    lineWidth: dm.branchStroke,
                    lineCap: .round
                ))
        }
    }
}

struct bracketView: View {
    @ObservedObject var dm = designModel()

    var width: CGFloat {
        dm.branchWidth + dm.branchsRadius
    }

    var height: CGFloat {
        dm.SubTopicHeight * 7 + dm.gridVerSpacing * 6
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
            BranchShapeBar(dm: dm)
                .stroke(Color.black, style: StrokeStyle(
                    lineWidth: dm.branchStroke,
                    lineCap: .round
                ))
                .frame(width: dm.branchWidth, height: dm.branchStroke)

            VStack {
                branch()

                branch()
                    .scaleEffect(x: 1, y: -1, anchor: .center)
            }
            .frame(width: width, height: height)
            .scaleEffect(x: -1, y: 1, anchor: .center)
        }
    }

    @ViewBuilder
    func branch() -> some View {
        VStack {
            CentralBranchShape(dm: dm, y: y)
                .stroke(Color.black, style: StrokeStyle(
                    lineWidth: dm.branchStroke,
                    lineCap: .round
                ))
        }
    }
}

struct CentralBranchShape: Shape {
    @ObservedObject var dm: designModel
    var y: CGFloat

    var animatableData: CGFloat {
        get { y }
        set { y = newValue }
    }

    var width: CGFloat {
        dm.branchWidth + dm.branchsRadius
    }

    var height: CGFloat {
        dm.SubTopicHeight * 7 + dm.gridVerSpacing * 6
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: dm.branchWidth, y: y))
        path.addArc(tangent1End: CGPoint(x: width, y: y), tangent2End: CGPoint(x: width, y: dm.branchsRadius + y), radius: dm.branchsRadius)
        path.addLine(to: CGPoint(x: width, y: height / 2))
        return path
    }
}

struct BranchShape: Shape {
    @ObservedObject var dm: designModel
    var y: CGFloat

    var animatableData: CGFloat {
        get { y }
        set { y = newValue }
    }

    var width: CGFloat {
        dm.branchWidth + dm.branchsRadius
    }

    var height: CGFloat {
        dm.SubTopicHeight * 3 + dm.gridVerSpacing * 2
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: dm.branchWidth, y: y))
        path.addArc(tangent1End: CGPoint(x: width, y: y), tangent2End: CGPoint(x: width, y: dm.branchsRadius + y), radius: dm.branchsRadius)
        path.addLine(to: CGPoint(x: width, y: height / 2))
        return path
    }
}

struct BranchShapeBar: Shape {
    @ObservedObject var dm: designModel
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height / 2))
        path.addLine(to: CGPoint(x: dm.branchWidth, y: rect.height / 2))
        return path
    }
}
