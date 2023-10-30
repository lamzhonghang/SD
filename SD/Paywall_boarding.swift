//
//  Paywall_A_5.swift
//  SD
//
//  Created by lan on 2023/10/24.
//

import SwiftUI

struct ChecklistView: View{
    let text: String
    let title: String
    let image: String
    
    var body: some View{
        HStack(alignment: .top){
            Image(systemName: image)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.red)
                .font(.title2)
                .bold()
                .frame(width: 46)
            VStack(alignment: .leading){
                Text(title)
                    .font(.body)
                    .bold()
                    .padding(.bottom, 1)
                Text(text)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 6)
    }
}

struct Paywall_boarding: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    VStack{
                        Image("Red")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding(.bottom, 8)
                            .shadow(color: .red.opacity(0.6), radius: 2)
                        Text("Upgrade to Pro")
                            .font(.title3)
                            .bold()
                        Text("For the xminder who want to professional one")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 30)
                    
                    VStack{
                        ChecklistView(text: "Attachemnt/Equation/Audio note/Topic link/Task/Numbering", title: "Insert", image: "paperclip.badge.ellipsis")
                        ChecklistView(text: "Presentations with one click", title: "Pitch", image: "play.square.stack")
                        ChecklistView(text: "Ensure the security of the file", title: "Set Password", image: "lock.doc")
                        ChecklistView(text: "Exporting without watermark.", title: "Export", image: "square.and.arrow.up.on.square")
                    }
                }
                .padding(24)
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Not Now")
                        .foregroundStyle(.tertiary)
                        .padding(.horizontal, 8)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            VStack{
                Text("14 days free trail then 388.00 / year until canceled.")
                    .font(.caption2)
                    .padding(.vertical, 6)
                Button{
                    //
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .tint(.white)
                        .padding()
                        .background(.red)
                        .fontWeight(.semibold)
                        .clipShape( RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview("5") {
    Paywall_boarding()
}
