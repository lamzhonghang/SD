//
//  BFooter.swift
//  SD
//
//  Created by lan on 2023/10/28.
//

import SwiftUI

struct BFooter: View {
    var body: some View {
        VStack(spacing: 10){
            Text("One plan for all platforms. Unlock the full potential of your creativity and productivity. One subscription is allowed to activate XMind on 5 Mac/PCs, and XMind on 5 mobile devices.")
            Text("After confirming your purchase, payment will be made through your iTunes account.Apple ID for automatic renewal subscription will be automatically charged for an additional 6 months in iTunes account 24 hours prior to the expiration of each billing cycle.")
            Text("You can cancel your subscription from your personal iTunes account during the subscription period. It is required to cancel the subscription at least 24 hours prior to the expiration of the existing plan.")
            HStack{
                Text("©2006-2023 Xmind Ltd.")
                Divider()
                    .frame(height: 8)
                Text("Privacy policy")
                Divider()
                    .frame(height: 8)
                Text("Terms of service")
                Spacer()
            }
            .font(.caption)
            .lineSpacing(2)
            .padding(.vertical)
        }
        .font(.caption2)
        .foregroundColor(.secondary)
        .padding()
        .background(Color(UIColor.quaternarySystemFill))
    }
}

#Preview {
    BFooter()
}
