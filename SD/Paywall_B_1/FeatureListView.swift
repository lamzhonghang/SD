//
//  FeatureListView.swift
//  SD
//
//  Created by lan on 2023/10/28.
//

import SwiftUI

struct FeatureListView: View {
    @Binding var showCompare: Bool
    var body: some View {
        VStack{
            VStack{
                Text("20+ Premium Features")
                    .BTitle()
            }
            .padding(.vertical, 24)
            
            ChecklistView(text: "Attachemnt/Equation/Audio note/Topic link/Task/Numbering", title: "Insert", image: "paperclip.badge.ellipsis")
            ChecklistView(text: "Presentations with one click", title: "Pitch", image: "play.square.stack")
            ChecklistView(text: "Ensure the security of the file", title: "Set Password", image: "lock.doc")
            ChecklistView(text: "Export without watermark.", title: "Export", image: "square.and.arrow.up.on.square")
            Button{
                showCompare.toggle()
            }label:{
                HStack{
                    Text("Compare plans & features")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.red)
                .padding(.vertical)
            }
        }
        .padding()
        .background(Color(UIColor.quaternarySystemFill).opacity(0.8))
    }
}

//#Preview {
//    FeatureListView()
//}
