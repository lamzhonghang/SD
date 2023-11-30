//
//  BFEntry.swift
//  SD
//
//  Created by lan on 2023/11/6.
//

import SwiftUI

struct BlackFridayEntry: View {
    @Binding var showPopUp: Bool
    
    var body: some View {
        VStack{
            Button(action: {
                withAnimation(.spring().speed(2)){
                    self.showPopUp = true
                }
            }, label: {
                ZStack(alignment:.trailing){
                    HStack(spacing:16){
                        Image("voice")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding(.horizontal, 8)
                            .offset(y:-6)
                            .overlay{
                                Image("rib")
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.15)
                            }
                            .scaleEffect(1.55)
                        VStack(alignment: .leading){
                            HStack{
                                Image("black_friday_50%_off")
                                    .resizable()
                                    .scaledToFit()
                            }
                            HStack(spacing: 4){
                                Text("Get 1 year for $29.99 !!")
                                Text("$59.99")
                                    .strikethrough()
                                    .opacity(0.5)
                            }
                            .minimumScaleFactor(0.8)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.footnote)
                        }
                    }
                    .padding(12)
                    .padding(.trailing,12)
                    Image("star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding(.horizontal, 20)
                        .offset(y:26)
                }
            })
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(
                        RadialGradient(colors: [Color(hex: 0x2b2b2b), Color.black], center: .center, startRadius: 16, endRadius: 400)
                    )
            )
            .frame(maxWidth: 420)
        }
    }
}

#Preview {
    BlackFridayEntry(showPopUp: .constant(true))
}
