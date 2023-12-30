//
//  Paywall_A_1.swift
//  SD
//
//  Created by lan on 2023/10/22.
//

import SwiftUI

struct Paywall_A_1: View {
    @State private var selectedIndex = 0
    @State private var showFeedback = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            VStack{
                TabView(selection: $selectedIndex){
                    banner1View()
                        .tag(0)
                    banner2View()
                        .tag(1)
                }
                .frame(height: 300)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                VStack{
                    Text("Start your 14 days free trail now")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text("Cancel anytime. Automatically renews.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                twoSubscriptionsView()
                    .padding(.horizontal)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea(.all)
        
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 16){
                Button{
                    showFeedback.toggle()
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .tint(.white)
                        .padding()
                        .background(.red)
                        .fontWeight(.semibold)
                        .clipShape( RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .padding(.horizontal, 24)
                }
                
                HStack{
                    Text("Privacy policy")
                    Spacer()
                    Text("Terms of service")
                }
                .font(.footnote)
                .padding(.horizontal, 24)
            }
        }
        .sheet(isPresented: $showFeedback, content: {
            PurchaseFeedbackView()
        })
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "xmark")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 8)
                        .tint(.white)
                }
            }
        }
    }
}

struct twoSubscriptionsView: View{
    @State private var selectedSubscription: String? = nil
    @Environment(\.dismiss) private var dismiss
    
    init() {
        _selectedSubscription = State(initialValue: "B")
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 16){
            HStack(alignment: .top, spacing: 16){
                VStack(spacing: 4){
                    Text("Monthly")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("¥38.00")
                        .font(.title3)
                        .bold()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.quaternarySystemFill))
                .frame(height: 110)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(selectedSubscription == "A" ? Color.red : .clear, lineWidth: 6)
                )
                .onTapGesture {
                    withAnimation(){
                        selectedSubscription = "A"
                    }
                }
                .cornerRadius(16)
                VStack{
                    ZStack(alignment: .topTrailing){
                        VStack(spacing: 4){
                            Text("Annually")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            Text("¥388.00")
                                .font(.title3)
                                .bold()
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(UIColor.quaternarySystemFill))
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(selectedSubscription == "B" ? Color.red : .clear, lineWidth: 6)
                        )
                        .onTapGesture {
                            withAnimation(){
                                selectedSubscription = "B"
                            }
                        }
                        .cornerRadius(16)
                        Text("-15%")
                            .font(.system(size: 11))
                            .bold()
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .foregroundColor(.white)
                            .background(Capsule().fill(.red))
                            .padding(8)
                    }
                    .frame(height: 110)
                    Text("$33.2 per month")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            .fontDesign(.rounded)
        }
    }
}



struct banner1View: View{
    var body: some View{
        VStack{
            HStack(alignment: .bottom){
                Image("xmind")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .foregroundColor(Color(UIColor.label))
                Image("Pro")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44)
            }
            .padding(.leading, 50)
            Text("Unleash the power of Xmind across all your devices")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .padding()
                .padding(.horizontal)
        }
        .preferredColorScheme(.dark)
    }
}

struct banner2View: View{
    var body: some View{
        HStack(spacing: 20){
            VStack(spacing: 30){
                award17iew()
                award100View()
                
            }
            VStack(spacing: 20){
                awardAppView()
                awardStarView()
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct award17iew: View{
    var body: some View{
        HStack{
            Image("wheat_left")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
            VStack(spacing: 4){
                ZStack(alignment:.topTrailing){
                    Text("17")
                        .font(.title)
                        .fontWeight(.black)
                    Text("th")
                        .font(.footnote)
                        .bold()
                        .offset(x: 18)
                }
                .frame(height: 24)
                Text("Anniversary")
                    .font(.system(size: 13))
                    .fontWeight(.black)
                Text("2006-2023")
                    .font(.system(size: 11))
            }
            Image("wheat_right")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
        }
        .foregroundColor(.primary.opacity(0.9))
    }
}

struct awardAppView: View{
    var body: some View{
        HStack{
            Image("wheat_left")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
            VStack(spacing: 4){
                Image(systemName: "apple.logo")
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 24)
                Text("App Store")
                    .font(.system(size: 13))
                    .fontWeight(.black)
                Text("App of the Day")
                    .font(.system(size: 11))
            }
            Image("wheat_right")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
        }
        .foregroundColor(.primary.opacity(0.9))
    }
}

struct DownloadsView: View{
    var body: some View{
        HStack{
            Image("wheat_left")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
            VStack(spacing: 4){
                Image("global_earth")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                Text("App Store")
                    .font(.system(size: 13))
                    .fontWeight(.black)
                Text("App of the Day")
                    .font(.system(size: 11))
            }
            Image("wheat_right")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
        }
        .foregroundColor(.primary.opacity(0.9))
    }
}

struct award100View: View{
    var body: some View{
        HStack{
            Image("wheat_left")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
            VStack{
                HStack(alignment: .firstTextBaseline, spacing: 4){
                    Text("100")
                        .font(.title2)
                        .fontWeight(.black)
                        .frame(height: 24)
                    Text("Million")
                        .font(.system(size: 13))
                        .fontWeight(.black)
                }
                Text("Download")
                    .font(.system(size: 13))
            }
            Image("wheat_right")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
        }
        .foregroundColor(.primary.opacity(0.9))
    }
}

struct awardStarView: View{
    var body: some View{
        HStack{
            Image("wheat_left")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
            VStack{
                HStack(alignment: .firstTextBaseline, spacing: 4){
                    Text("4.8")
                        .font(.title2)
                        .fontWeight(.black)
                        .frame(height: 24)
                    Text("Stars")
                        .font(.system(size: 13))
                        .fontWeight(.black)
                }
                Text("300,000+ Reviews")
                    .font(.system(size: 13))
            }
            Image("wheat_right")
                .resizable()
                .scaledToFit()
                .frame(width: 24)
        }
        .foregroundColor(.primary.opacity(0.9))
    }
}

#Preview {
    Paywall_A_1()
}
