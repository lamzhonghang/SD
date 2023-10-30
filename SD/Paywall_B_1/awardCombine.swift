//
//  awardCombine.swift
//  SD
//
//  Created by lan on 2023/10/27.
//

import SwiftUI

struct awardCombine: View {
    var body: some View {
        HStack(spacing: 16){
            VStack(spacing: 4){
                Image(systemName: "apple.logo")
                    .font(.title3)
                    .fontWeight(.black)
                    .frame(height: 24)
//                Text("App Store")
//                    .font(.system(size: 12))
//                    .fontWeight(.black)
                Text("App of the Day")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
            }
            
            Divider()
                .frame(height: 40)
            
            VStack(spacing: 4){
                Image(systemName: "person.fill")
                    .font(.title3)
                    .fontWeight(.medium)
                    .frame(height: 24)
                Text("179k+ Ratings")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
            }
            
            Divider()
                .frame(height: 40)
            
            VStack(spacing: 4){
                HStack(spacing:2){
                    ForEach(0...4, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .imageScale(.small)
                            .font(.footnote)
                    }
                }
                .frame(height: 24)
                Text("4.8 Stars")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
            }
        }
        .foregroundColor(Color(UIColor.secondaryLabel))
        .padding(.horizontal)
    }
}

#Preview {
    awardCombine()
}
