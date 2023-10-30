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
    
    var body: some View {
        NavigationSplitView {
            DetailCtrlView(dm: dm)
                .navigationSplitViewColumnWidth(1000)
                .navigationTitle("Format")
                .navigationBarTitleDisplayMode(.inline)
        } detail: {
            NavigationStack{
                ZStack{
                    if dm.isTreeChart{
                        TreeView(dm: dm, namespace: shapeTransition)
                    } else if dm.isTimeLine{
                        TimelineView(dm:dm, namespace: shapeTransition)
                    } else if dm.isRadial{
                        RadialView(dm:dm, namespace: shapeTransition)
                    } else{
                        GridView(dm:dm, namespace: shapeTransition)
                    }
                }
                .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight / 4 * 2)
                .padding()
                .preferredColorScheme(dm.isDarkMode ? .dark : .light)
                .navigationTitle("SnowDance for Designer")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview("Home"){
    ContentView()
}

//#Preview("Grid"){
//    GridView()
//}
//
//#Preview("TimeLine") {
//    TimelineView(, namespace: <#Namespace.ID#>)
//}
