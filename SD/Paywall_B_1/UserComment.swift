//
//  UserComment.swift
//  SD
//
//  Created by lan on 2023/10/27.
//

import SwiftUI

struct UserRecommandationAll: View {
    var body: some View{
        VStack(spacing: 0){
            Text("100 Million+ Users")
                .BTitle()
                .padding(.bottom, 32)
            
            awardCombine()
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: 12){
                    Group{
                        UserRecommandation(title: "Xmind is a really powerful tool :)", text: "Keep up the good work, the product evolved really well. I have been using the product for more than 10 years and I love it. In my current work, XMind was not an approved tool, I fought for it. My management and all my colleagues love it.", name: "Chris")
                        UserRecommandation(title: "I love mindmaps!", text: "made it super easy to use the mindmap as a fullscreen presentation tool. As a speaker, it helped stay focused on topic under discussion and not get lost with lots of context switching and scope creep. I think I will try it more ", name: "Geek")
                        UserRecommandation(title: "It's simple but powerful.", text: "I've been a Tony Buzan Licensed Instructor for several years. (one of the few TBLIs in the USA). I've used Mind Manager, Mind Genius, iMindMap, Mindomo, MindMasterand others, but Xmind is BY FAR my favorite and my 'go to' mind mapping software. It's simple but powerful. The BEST feature is that Xmind works similarly on Android as it does on MS Windows. !", name: "Mary")
                    }
                    .containerRelativeFrame(.horizontal, alignment:.center){
                        length,axis in
                        return length / 10 * 8.5
                    }
                }
                .padding()
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        }
        .padding(.top, 42)
    }
}


struct UserRecommandation: View {
    let title: String
    let text: String
    let name: String
    
    var body: some View {
        VStack(spacing: 10){
            VStack{
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 4){
                        Text(title)
                            .bold()
                        HStack(spacing:2){
                            ForEach(0...4, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.orange)
                                    .imageScale(.small)
                                    .font(.footnote)
                            }
                        }
                    }
                    Spacer()
                    Text(name)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .bold()
                }
                .font(.subheadline)
                
            }
            Text(text)
                .multilineTextAlignment(.leading)
                .font(.subheadline)
        }
        .frame(height: 150)
        .padding(16)
        .background(Color(UIColor.quaternarySystemFill))
        .cornerRadius(12)
    }
}
//
//#Preview {
//    UserRecommandation(title: <#String#>, text: <#String#>, name: <#String#>)
//}
