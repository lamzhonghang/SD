//
//  ToggleView.swift
//  SD
//
//  Created by lan on 2024/1/2.
//

import SwiftUI

struct ToggleView: View {
    @State private var isOn1 = false
    @State private var isOn2 = false
    var body: some View {
        ScrollView {
            VStack {
                Text("Toggle")
                    .modifier(TokenTitle())
                VStack {
                    Toggle("Toggle", isOn: $isOn1)
                        .toggleStyle(SwitchToggleStyle(tint: GYToggle.accent.normal))
                    Toggle("Toggle", isOn: $isOn2)
                        .toggleStyle(SwitchToggleStyle(tint: GYToggle.accent.normal))
                        .disabled(true)
                }
                .labelsHidden()
                .frame(maxWidth: 480)
            }
            .padding()
            .navigationTitle("Toggle")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ToggleView()
}
