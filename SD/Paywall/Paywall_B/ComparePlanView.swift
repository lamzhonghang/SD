//
//  ComparePlanView.swift
//  SD
//
//  Created by lan on 2023/10/26.
//

import SwiftUI

struct ComparePlanGridRow: View {
    let feature: String
    let isFree: Bool
    let isPro: Bool
    
    var body: some View {
        GridRow(){
            Text(feature)
                .gridColumnAlignment(.leading)
            
            if !isFree{
                Text("-")
                    .padding()
            } else {
                Image(systemName: "checkmark")
                    .padding()
            }
            
            if !isPro{
                Text("-")
                    .padding()
            } else {
                Image(systemName: "checkmark")
                    .padding()
            }
        }
        .font(.subheadline)
    }
}

struct ComparePlanView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView{
                Grid(verticalSpacing: 0){
                    GridRow{
                        Text("")
                        Text("Free")
                        Text("Pro")
                    }
                    .bold()
                    .frame(height: 40)
                    .font(.subheadline)
                    
                    Divider()
                        .padding(.bottom)
                    
                    ComparePlanGridRow(feature: "Unlimited Topics & Maps", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "All Structures & Shapes", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "Templates & Library", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "Skeleton & Theme", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "File Cache", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "Outliner", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "Hand draw Style", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "Relationship & Boundary & Summary", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "Stickers & illustrations", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "Marker & Label", isFree: true, isPro: true)
                    ComparePlanGridRow(feature: "Notes", isFree: true, isPro: true)
                    
                    GridRow{
                        Text("Device Limit")
                        Text("2")
                        Text("5")
                            .padding()
                    }
                    .font(.subheadline)
                    
                    GridRow{
                        Text("Colored Branch")
                        Text("Limited")
                        Image(systemName: "checkmark")
                            .padding()
                    }
                    .font(.subheadline)
                    
                    GridRow{
                        Text("Pitch")
                        Text("5 slides")
                        Image(systemName: "checkmark")
                            .padding()
                    }
                    .font(.subheadline)
                    
                    GridRow{
                        Text("ZEN Mode")
                        Text("Default")
                        Image(systemName: "checkmark")
                            .padding()
                    }
                    .font(.subheadline)
                    
                    ComparePlanGridRow(feature: "Math Equation", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Audio Notes", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Attachment", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Topic Link", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Local File Link", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Numbering", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Task Tracking", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Set Password", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Remove watermark", isFree: false, isPro: true)
                    
                    Divider()
                        .padding(.vertical)
                    
                    GridRow{
                        Text("Desktop Only")
                        Text("")
                        Text("")
                    }
                    .font(.footnote)
                    .textCase(.uppercase)
                    .bold()
                    .foregroundStyle(.tertiary)
                    .padding(.vertical)
                    
                    ComparePlanGridRow(feature: "Merge Xmind Files", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Custom Themes", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Custom Smart Color Themes", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Align Floating Topic", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Show Branch Only", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Split mind map by main branch", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Filter by makers/labels", isFree: false, isPro: true)
                    
                    ComparePlanGridRow(feature: "Export into 2x or 3x size", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Export Pitch to PowerPoint", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Export to SVG/Markdown/OPML/Textbundle", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Export to Excel/Word", isFree: false, isPro: true)
                    ComparePlanGridRow(feature: "Save Topics Image As", isFree: false, isPro: true)
                    GridRow{
                        Text("Export to PNG/PDF")
                        Text("Single")
                        Text("All")
                            .padding()
                    }
                    .font(.subheadline)
                    
                    Divider()
                        .padding(.vertical)
                    
                    GridRow{
                        Text("Customer Service")
                        Text("")
                        Text("")
                    }
                    .font(.footnote)
                    .textCase(.uppercase)
                    .bold()
                    .foregroundStyle(.tertiary)
                    .padding(.vertical)
                    
                    ComparePlanGridRow(feature: "Priority Support", isFree: false, isPro: true)
                    
                }
                .padding(.horizontal, 20)
            }
            .safeAreaInset(edge: .bottom) {
                Button{
                    //                        showFeedback.toggle()
                } label: {
                    VStack(spacing: 2){
                        Text("Get Started")
                    }
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .tint(.white)
                    .padding(8)
                    .frame(height: 54)
                    .background(.red)
                    .clipShape( RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .padding(.horizontal)
                    .padding(.top)
                    .background(.background)
                    .shadow(color:Color(UIColor.separator), radius: 0, x:0, y: -0.33)
                }
            }
            .navigationTitle("Compare Plans")
            .toolbar{
                ToolbarItem{
                    Button{
                        dismiss()
                    }label:{
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color(UIColor.secondaryLabel), .thinMaterial)
                    }
                }
            }
        }
    }
}

#Preview("compare") {
    ComparePlanView()
}
