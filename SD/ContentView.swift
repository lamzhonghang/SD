//
//  ContentView.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI

struct ContentView: View {
    @State private var sd = SDData()
    @StateObject var dm = designModel()
    @Namespace private var shapeTransition
    @State private var showSidePanel = true

    var body: some View {
        ZStack {
            Color.secondary.opacity(0.1)
                .ignoresSafeArea(.all)
            HStack(spacing: 12) {
                if showSidePanel {
                    DetailCtrlView(dm: dm)
                        .navigationTitle("Format")
                        .navigationBarTitleDisplayMode(.inline)
                        .cornerRadius(20)
                        .frame(width: 400)
                        .padding(.vertical)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                }

                NavigationStack {
                    ZStack {
                        if dm.isTreeChart {
                            TreeView(dm: dm, namespace: shapeTransition)
                        } else if dm.isTimeLine {
                            TimelineView(dm: dm, namespace: shapeTransition)
                        } else if dm.isRadial {
                            RadialView(dm: dm, namespace: shapeTransition)
                        } else {
                            GridView(dm: dm, namespace: shapeTransition)
                        }
                    }
                    .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight / 4 * 2)
                    .padding()
                    .preferredColorScheme(dm.isDarkMode ? .dark : .light)
                    .navigationTitle("SnowDance for Designer")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                withAnimation(.snappy) {
                                    showSidePanel.toggle()
                                }
                            } label: {
                                Image(systemName: "sidebar.left")
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .background(dm.backgroundFillColor)
                }
                .cornerRadius(20)
                .padding(.vertical)
            }
            .padding(.horizontal)
        }
        .font(.subheadline)
    }
}

#Preview("Home") {
    ContentView()
}

// #Preview("Grid"){
//    GridView()
// }
//
// #Preview("TimeLine") {
//    TimelineView(, namespace: <#Namespace.ID#>)
// }
