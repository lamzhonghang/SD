//
//  Paywall_B_2.swift
//  SD
//
//  Created by lan on 2023/10/28.
//

import SwiftUI

struct Paywall_B_2: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedIndex = 0
    @State private var selectedSubscription: String?
    @State private var showCompare = false
    @State private var showGiftCard = false
    
    init() {
        _selectedSubscription = State(initialValue: "B")
    }
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 0){
                    BBannerView()
                    ListSubsView(selectedSubscription: $selectedSubscription)
                    FeatureListView(showCompare: $showCompare)
                    UserRecommandationAll()
                    FAQView()
                        .padding()
                    BFooter()
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        dismiss()
                    }label:{
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .imageScale(.large)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color(UIColor.secondaryLabel), .thinMaterial)
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0){
                    HStack(){
                        Button{
                            showGiftCard.toggle()
                        }label: {
                            Image(systemName: "giftcard")
                                .padding(14)
                                .frame(height: 54)
                                .background(.red.opacity(0.1))
                                .imageScale(.medium)
                                .cornerRadius(10)
                        }
                        Button{
                            //
                        } label: {
                            VStack(spacing: 2){
                                Text("Try Free & Subscribe")
                                    .font(.subheadline)
                                Text(selectedSubscription == "B" ? "Charge after trial, 388.00/Year" : "Charge after trial, 38.00/Month")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                    .bold()
                            }
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .tint(.white)
                            .padding(8)
                            .frame(height: 54)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                .background(.background)
                .shadow(color:Color(UIColor.separator), radius: 0, x:0, y: -0.33)
                .shadow(color:Color(UIColor.systemBackground), radius: 12, x:0, y: -16)
            }
            .sheet(isPresented: $showCompare) {
                ComparePlanView()
            }
            .sheet(isPresented: $showGiftCard) {
                GidtCardPageView()
            }
        }
    }
}

struct ListSubsView: View {
    @Binding var selectedSubscription: String?
    @Environment(\.dismiss) private var dismiss
//    @Namespace private var shapeTransition
    
    var body: some View {
        VStack {
            Text("Choose a plan")
                .BTitle()
                .padding(.bottom, 8)
            VStack(spacing: 12){
                VStack(alignment:.leading, spacing: 4){
                    Text("Monthly")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Text("¥38.00")
                        .font(.system(size: 17))
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .background(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .frame(height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(selectedSubscription == "A" ? Color.red : Color(UIColor.systemGray5), lineWidth: selectedSubscription == "A" ? 2 : 1)
//                        .matchedGeometryEffect(id: "select", in: shapeTransition)
                )
               
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.1)){
                        selectedSubscription = "A"
                    }
                }
                VStack{
                    ZStack(alignment: .topTrailing){
                        VStack(alignment:.leading, spacing: 4){
                            Text("Annually")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            HStack(alignment:.firstTextBaseline, spacing: 4){
                                Text("¥388.00")
                                    .font(.system(size: 17))
                                    .fontWeight(.heavy)
                                Text("(¥32.00/month)")
                                    .bold()
                                    .font(.footnote)
                                    .foregroundColor(Color(UIColor.tertiaryLabel))
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(selectedSubscription == "B" ? Color.red : Color(UIColor.systemGray5), lineWidth: selectedSubscription == "B" ? 2 : 1)
//                                .matchedGeometryEffect(id: "select", in: shapeTransition)
                        )
                        
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)){
                                selectedSubscription = "B"
                            }
                        }
                        Text("Best Seller & -15%")
                            .font(.system(size: 11))
                            .bold()
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .foregroundColor(.white)
                            .background(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 6,bottomTrailing: 0, topTrailing: 6)).fill(.red))
                    }
                    .frame(height: 80)
                }
            }
            .fontDesign(.rounded)
            .padding()
        }
        .padding(.top, 32)
        .background(Color(UIColor.quaternarySystemFill).opacity(0.8))
    }
}

#Preview ("Paywall B") {
    Paywall_B_2()
}
