//
//  FAQ.swift
//  SD
//
//  Created by lan on 2023/10/27.
//

import SwiftUI

struct FAQView: View {
    @State private var show1 = false
    @State private var show2 = false
    @State private var show3 = false
    @State private var show4 = false
    
    var body: some View {
        VStack {
            Text("FAQ")
                .BTitle()
            
            VStack(spacing: 16){
                DisclosureGroup(isExpanded: $show1) {
                    VStack{
                        Text("Xmind is available on Windows, macOS, Linux, iOS/iPadOS, Android and Web. One subscription is allowed to upgrade 5 Mac/PCs and 5 mobile devices to Xmind Pro.")
                            .font(.subheadline)
                        Divider()
                    }
                } label:{
                    Text("Which and how many devices do you support?")
                        .bold()
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 8)
                }
                
                DisclosureGroup(isExpanded: $show2) {
                    VStack{
                        Text("With Xmind's free plan, you are already able to enjoy all the basic features to create a wonderful mind map. To further enhance your productivity and creativity, an upgrade to Xmind Pro will unleash all the powerful features and be able to use for commercial purposes.")
                            .font(.subheadline)
                        Divider()
                    }
                } label:{
                    Text("Why should I upgrade to Xmind Pro?")
                        .bold()
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 8)
                }
                
                DisclosureGroup(isExpanded: $show3) {
                    VStack{
                        Text("If you are purchasing through our website, we support credit/debit card payment, powered by Stripe. To ensure your security, the entire transaction will be SSL encrypted.")
                            .font(.subheadline)
                        Divider()
                    }
                } label:{
                    Text("What payment method do you provide?")
                        .bold()
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 8)
                }
                
                DisclosureGroup(isExpanded: $show4) {
                    VStack{
                        Text("The subscription of Xmind Pro automatically renews and can be cancelled anytime. If you purchase Xmind Pro Annually from our website, we will offer you a 30-day Money Back Guaranteed to use Xmind Pro stress-free.")
                            .font(.subheadline)
                        //                        Divider()
                    }
                } label:{
                    Text("How to cancel subscription and request a refund?")
                        .bold()
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 8)
                }
            }
            .tint(Color(UIColor.label))
            
            Divider()
                .padding(.vertical)
            
            Text("More questions?")
                .BTitle()
                .padding(.vertical)
            
            VStack(alignment: .center,spacing: 16){
                HStack(alignment: .firstTextBaseline, spacing: 4){
                    Text("Visit our")
                    Link("support center",
                         destination: URL(string: "https://support.xmind.net/hc/en-us")!)
                    Image(systemName: "arrow.up.forward")
                        .foregroundColor(.accentColor)
                        .imageScale(.small)
                }
                Text("Contact: support@xmind.app")
                HStack(spacing: 4){
                    Text("Already subscribed?")
                    Button{
                        //
                    }label: {
                        Text("Restore Purchase.")
                    }
                }
            }
            .font(.subheadline)
            .padding(.bottom, 42)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.top ,24)
    }
}

#Preview {
    FAQView()
}
