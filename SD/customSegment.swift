//
//  customSegment.swift
//  SD
//
//  Created by lan on 2023/11/14.
//

import SwiftUI

struct CustomSegmentControlView<Content: View>: View {
    private var segments: [String]
    @Binding private var selection: Int
    private var onSegmentSelected: (Int) -> Void
    private var iconContent: (Int) -> Content

    init(segments: [String], selection: Binding<Int>, onSegmentSelected: @escaping (Int) -> Void, iconContent: @escaping (Int) -> Content) {
        self.segments = segments
        self._selection = selection
        self.onSegmentSelected = onSegmentSelected
        self.iconContent = iconContent
    }

    var body: some View {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100),spacing: 16)], spacing: 16){
                ForEach(segments.indices, id: \.self) { index in
                    GridRow{
                        VStack {
                            self.iconContent(index)
                                .padding()
                            Text(segments[index])
                        }
                        .foregroundColor(Color(UIColor.label))
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(selection == index ? Color(UIColor.systemGray6) : Color.clear)
                        .cornerRadius(8)
                        .onTapGesture {
                            withAnimation {
                                self.selection = index
                                self.onSegmentSelected(index) // Call the custom action
                            }
                        }
                    }
                }
            }
    }
}

struct CustomSegmentControlView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentControlView(
            segments: ["Home", "Favorites", "Profile"],
            selection: .constant(0),
            onSegmentSelected: { index in
                switch index {
                case 0:
                    print("Selected Home Segment")
                    // Add your custom action for the Home segment
                case 1:
                    print("Selected Favorites Segment")
                    // Add your custom action for the Favorites segment
                case 2:
                    print("Selected Profile Segment")
                    // Add your custom action for the Profile segment
                default:
                    break
                }
            },
            iconContent: { index in
                // Replace this with your custom icon view
                Image(systemName: "star")
            }
        )
    }
}
