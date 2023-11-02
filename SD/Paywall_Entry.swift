//
//  Paywall_Entry.swift
//  SD
//
//  Created by lan on 2023/10/23.
//

import SwiftUI
import TipKit

struct Paywall_Button: View {
    let title: String
    let subtitle: String
    let text: String
    
    var body: some View{
        HStack {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text(subtitle)
                        .fontWeight(.heavy)
                        .font(.title3)
                    Text(title)
                        .bold()
                        .font(.subheadline)
                }
            }
            Spacer()
            Image(systemName: "chevron.forward")
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.secondary)
        }
        //        .padding(20)
        //        .background(.fill.quaternary)
        //        .cornerRadius(20)
    }
}

struct Paywall_Entry: View {
    @State private var showA1 = false
    @State private var showA2 = false
    @State private var showA3 = false
    
    @State private var showB1 = false
    @State private var showB2 = false
    @State private var showB3 = false
    
    @State private var showC1 = false
    
    @State private var showCard = false
    
    @State private var showBoarding = false
    
    @State private var showInfo = false
    
    @Environment(\.dismiss) private var dismiss
    
    var tip = paywallTip()
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Button{
                        showCard.toggle()
                    }label: {
                        Paywall_Button(title: "还没做完", subtitle: "Member Card", text: "")
                    }
                } footer:{
                    Text("用户查看订阅信息的页面")
                }
                
                Section{
                    Button{
                        showA1.toggle()
                    }label: {
                        Paywall_Button(title: "Paywall_A_1", subtitle: "Slide", text: "")
                    }
                } footer:{
                    Text("展示具体的特性和清晰的订阅信息，用户快速获取品牌和功能的介绍。")
                }
                
                Section{
                    Button{
                        showA2.toggle()
                    }label: {
                        Paywall_Button(title: "Paywall_A_2", subtitle: "Trail", text: "")
                    }
                } footer:{
                    Text("手把手告诉你如何免费试用且提醒你试用到期，提升用户的信任感，以及转移用户的付费专注。")
                }
                
                Section{
                    Button{
                        showA3.toggle()
                    }label: {
                        Paywall_Button(title: "Paywall_A_3", subtitle: "Card", text: "")
                    }
                } footer:{
                    Text("粗糙版本的免费试用卡片，可以考虑再弄一个彩色版本的，主要是颜值和流畅动画吸引用户")
                }
                
                Section{
                    Button{
                        showB1.toggle()
                    }label: {
                        Paywall_Button(title: "Paywall_B_1", subtitle: "Landing 1", text: "")
                    }
                } footer:{
                    Text("是一个浓缩的落地页版本, 包含了订阅选择，解锁的主要功能属性，以及更加详细的对比pro和free的列表，所获得的荣誉，以及用户的评价，和FAQ等等")
                }
                
                Section{
                    Button{
                        showB2.toggle()
                    }label: {
                        Paywall_Button(title: "Paywall_B_2", subtitle: "Landing 2", text: "")
                    }
                } footer:{
                    Text("这也是落地页版本，相对于方案1可以在底部时时刻刻看到订阅的价格和选择，这个方案把这个订阅放在视觉的核心位置。")
                }
                
                Section{
                    Button{
                        showB3.toggle()
                    }label: {
                        Paywall_Button(title: "Paywall_B_3", subtitle: "Landing 2", text: "")
                    }
                } footer:{
                    Text("这也是落地页版本，相对于方案1可以在底部时时刻刻看到订阅的价格和选择，这个方案把这个订阅放在视觉的核心位置。")
                }
                
                Section{
                    Button{
                        showC1.toggle()
                    }label: {
                        Paywall_Button(title: "Paywall_C_1", subtitle: "Offer", text: "")
                    }
                } footer:{
                    Text("不恶心版本的限时特价，通过比较打折后的月订阅价格，和限时一天的倒计时，和闪亮动感的cta。")
                }
                
                Button{
                    showBoarding.toggle()
                }label: {
                    Paywall_Button(title: "Onboarding", subtitle: "List", text: "用简约的特性列表告诉用户付费的点，弱化的标题和继续的cta，是一个简单的欢迎页面，预设是只有第一次安装才弹。")
                }
            }
            .tint(Color(UIColor.label))
            .sheet(isPresented: $showA1, content: {
                Paywall_A_1()
            })
            .sheet(isPresented: $showA2, content: {
                Paywall_A_2()
            })
            .sheet(isPresented: $showA3, content: {
                Paywall_A_3()
            })
            .sheet(isPresented: $showC1, content: {
                Paywall_C_1()
            })
            .sheet(isPresented: $showBoarding, content: {
                Paywall_boarding()
            })
            .fullScreenCover(isPresented: $showB1, content: {
                Paywall_B_1()
                
            })
            .fullScreenCover(isPresented: $showB2, content: {
                Paywall_B_2()
                
            })
            .fullScreenCover(isPresented: $showB3, content: {
                Paywall_B_3()
                
            })
            .fullScreenCover(isPresented: $showCard, content: {
                MemberCard()
            })
            .sheet(isPresented: $showInfo, content: {
                InfoView()
            })
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showInfo.toggle()
                    }label:{
//                        ZStack {
                            
                            Image(systemName: "info.circle")
//                            TipView(tip, arrowEdge: .top)
//                                .padding(.top, 124)
//                        }
//                        .task {
//                            try? Tips.configure([
//                                .displayFrequency(.immediate),
//                                .datastoreLocation(.applicationDefault)
//                            ])
//                        }
                    }
                }
            }
            .navigationTitle("Paywall")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ListView: View {
    let title: String
    let text: String
    let timing: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            HStack(alignment: .top){
                Text("内容:")
                    .bold()
                Text(text)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .font(.subheadline)
            HStack(alignment: .top){
                Text("时机:")
                    .bold()
                Text(timing)
            }
            .font(.subheadline)
            
            Divider()
                .padding(.vertical)
        }
    }
}

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 0){
                    ListView(title: "Paywall A", text: "每天弹出的付费墙。", timing: "进入软件且操作超过10分钟自动弹出一个表单。")
                    ListView(title: "Paywall B", text: "内容相对详细，可以很好地传达出品牌的价值和软件的功能，以及付费点，有用户的评价，评分，或者有更多在付费过程中会遇到的问题。", timing: "在设置页面主动唤起")
                    ListView(title: "Paywall C", text: "降价，促销，活动等都可以用这种方式。", timing: "咔嚓叮呤哐当迅雷不及掩耳就弹出来了")
                    ListView(title: "Paywall onBoarding", text: "第一次安装弹出来的付费页面，只弹一次", timing: "安装后进入主页面。")
                }
                .padding()
            }
            .navigationTitle("付费墙分类")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        dismiss()
                    }label:{
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

struct paywallTip: Tip{
    var assert: Image?{
        Image(systemName: "info.circle")
    }
    
    var title: Text{
        Text("付费墙的分类说明")
    }
    
    var text: Text?{
        Text("World")
    }
}


#Preview {
    Paywall_Entry()
}
