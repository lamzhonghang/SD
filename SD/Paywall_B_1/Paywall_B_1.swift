//
//  Paywall_B_1.swift
//  SD
//
//  Created by lan on 2023/10/25.
//

import SwiftUI

struct Paywall_B_1: View {
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
                    bottomSubsView(selectedSubscription: $selectedSubscription)
                        .padding(.vertical, 12)
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
                            .clipShape( RoundedRectangle(cornerRadius: 10, style: .continuous))
                        }
                    }
                }
                .padding(.horizontal)
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



struct BTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.title2)
            .bold()
    }
}

struct bottomSubsView: View {
    @Binding var selectedSubscription: String?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack(alignment: .top, spacing: 10){
            VStack(alignment:.leading, spacing: 2){
                Text("Monthly")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text("¥38.00")
                    .font(.system(size: 17))
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .background(Color(UIColor.quaternarySystemFill).opacity(0.5))
            .frame(height: 60)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(selectedSubscription == "A" ? Color.red : .clear, lineWidth: 4)
            )
            .onTapGesture {
                withAnimation(){
                    selectedSubscription = "A"
                }
            }
            .cornerRadius(10)
            VStack{
                ZStack(alignment: .topTrailing){
                    VStack(alignment:.leading, spacing: 2){
                        Text("Annually")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Text("¥388.00")
                            .font(.system(size: 17))
                            .fontWeight(.heavy)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.horizontal, 12)
                    .background(Color(UIColor.quaternarySystemFill).opacity(0.5))
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(selectedSubscription == "B" ? Color.red : .clear, lineWidth: 4)
                    )
                    .onTapGesture {
                        withAnimation(){
                            selectedSubscription = "B"
                        }
                    }
                    .cornerRadius(10)
                    Text("Best Seller")
                        .font(.system(size: 9))
                        .bold()
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .foregroundColor(.white)
                        .background(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 6,bottomTrailing: 0, topTrailing: 6)).fill(.red))
                }
                .frame(height: 60)
            }
        }
        .fontDesign(.rounded)
    }
}




#Preview ("Bento"){
    BBannerView()
}

#Preview ("Paywall B") {
    Paywall_B_1()
}

#Preview {
    FAQView()
}
