//
//  Paywall_A_2.swift
//  SD
//
//  Created by lan on 2023/10/22.
//

import SwiftUI

struct Paywall_A_2: View {
    @State private var showSubs = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    Text("How you free trail work?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .frame(width:300, alignment: .leading)
                    ZStack(alignment: .topLeading){
                        Rectangle()
                            .frame(width: 2)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 18)
                            .opacity(0.3)
                        Rectangle()
                            .fill(.red)
                            .frame(width: 2, height: 55)
                            .padding(.vertical)
                            .padding(.horizontal, 18)
                        VStack(alignment: .leading, spacing: 22){
                            HStack(alignment: .top){
                                Image(systemName: "lock.slash.fill")
                                    .padding(10)
                                    .bold()
                                    .font(.subheadline)
                                    .colorInvert()
                                    .background(Circle().fill(.red).stroke(.background, lineWidth: 6))
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Today:")
                                            .bold()
                                        Text("Get All Instant accesss")
                                        Spacer()
                                    }
                                    .font(.title3)
                                    .foregroundColor(.red)
                                    Text("Access 40+ premuium features: Unlimited Color theme and skeleton, Pitch Mode")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 8)
                                Spacer()
                            }
                            HStack(alignment: .top){
                                Image(systemName: "bell.badge.fill")
                                    .padding(10)
                                    .colorInvert()
                                    .background(Circle().fill(Color(UIColor.label)).stroke(.background, lineWidth: 6))
                                    .font(.subheadline)
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Day 11:")
                                            .bold()
                                        Text("Trail Reminder")
                                    }
                                    .font(.title3)
                                    Text("We'll send you a notification that your trail is ending")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 8)
                                Spacer()
                            }
                            HStack(alignment: .top){
                                Image(systemName: "star.fill")
                                    .padding(10)
                                    .colorInvert()
                                    .background(Circle().fill(Color(UIColor.label)).stroke(.background, lineWidth: 6))
                                    .font(.subheadline)
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Day 14:")
                                            .bold()
                                        Text("Trail End")
                                    }
                                    .font(.title3)
                                    Text("Your subscription will be start on Sep 22")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 8)
                                Spacer()
                            }
                        }
                    }
                }
                .padding(24)
            }
            .sheet(isPresented: $showSubs, content: {
                twoSubscriptionView()
                    .presentationDetents([.height(250)])
            })
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 16){
                    VStack{
                        HStack(spacing: 12){
                            Button{
                                showSubs.toggle()
                            } label:{
                                HStack(spacing: 4){
                                    Text("Annually")
                                        .underline()
                                    Image(systemName: "chevron.right")
                                        .imageScale(.small)
                                }
                                .bold()
                            }
                            .foregroundColor(Color(UIColor.label))
                            Text("$388.00")
                        }
                        .font(.subheadline)
                        HStack{
                            Text("Recurring Billing")
                            Circle()
                                .frame(width: 2)
                            Text("Cancel Anytime")
                        }
                        .font(.subheadline)
                    }
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
                            .padding(.horizontal, 24)
                    }
                    
                    HStack{
                        Text("Privacy policy")
                        Spacer()
                        Text("Terms of service")
                    }
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 24)
                }
            }
            .sheet(isPresented: $showSubs, content: {
                twoSubscriptionView()
                    .presentationDetents([.height(250)])
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
                    }
                }
            }
        }
    }
}

#Preview("paywall2") {
    Paywall_A_2()
}

struct twoSubscriptionView: View{
    @State private var selectedSubscription: String? = nil
    @Environment(\.dismiss) private var dismiss
    init() {
        _selectedSubscription = State(initialValue: "B")
    }
    var body: some View{
        NavigationStack{
            ScrollView(showsIndicators: false){
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
                                        .font(.subheadline)
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
                    //                    Spacer()
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
            .navigationTitle("Choose your subscription")
            .navigationBarTitleDisplayMode(.inline)
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

#Preview("subs") {
    twoSubscriptionView()
}
