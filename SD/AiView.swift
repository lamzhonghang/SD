//
//  AiView.swift
//  SD
//
//  Created by lan on 2023/12/8.
//

import SwiftUI

struct AiContentView: View {
    var body: some View {
        NavigationStack {
            AiView()
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        HStack {
                            Button {
                                //
                            } label: {
                                Image(systemName: "square.grid.2x2")
                            }
                            .foregroundStyle(.black)
                            Button {} label: {
                                HStack(spacing: 8) {
                                    Text("Untitled Doc")
                                        .bold()
                                    Divider()
                                        .frame(height: 16)
                                    Text("Sheet 1")
                                        .foregroundStyle(.secondary)
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 8))
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .foregroundStyle(.black)

                            Button {
                                //
                            } label: {
                                HStack {
                                    Text("100%")
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 8))
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .foregroundStyle(.black)
                        }
                        .font(.subheadline)
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            //
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.subheadline)
                                .bold()
                        }
                    }
                }
        }
    }
}

struct GridsView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 10))], content: {
            ForEach(0 ..< 50) { _ in
                Circle()
                    .frame(width: 2)
            }
        })
    }
}

struct AiView: View {
    @State var viewState = CGSize.zero
    @State private var cumulativeDrag = CGSize.zero
    @State private var currentScale: CGFloat = 1
    @State private var finalScale: CGFloat = 1
    @State private var isSelect = false
    var offsets: CGFloat = 36

    var body: some View {
        ZStack {
            ZStack {
                Color(UIColor.systemBackground)
                    .onTapGesture {
                        isSelect = false
                    }
                HStack {
                    Text("I am a fucking gay")
                        .padding()
                        .padding(.horizontal, 6)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                isSelect.toggle()
                            }
                        }
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .cornerRadius(8)
                        .overlay(alignment: .trailing) {
                            Rectangle()
                                .frame(width: 80, height: 2)
                                .offset(x: 80)
                                .foregroundStyle(.indigo)
                        }
                        .padding(3)

                        .overlay(alignment: .top) {
                            if isSelect {
                                Button {
                                    //
                                } label: {
                                    plusButton()
                                }
                                .offset(y: -offsets)
                            }
                        }
                        .overlay(alignment: .top) {
                            if isSelect {
                                Button {
                                    //
                                } label: {
                                    aiButton()
                                }
                                .offset(x: offsets, y: -offsets)
                            }
                        }
                        .overlay(alignment: .bottom) {
                            if isSelect {
                                Button {
                                    //
                                } label: {
                                    plusButton()
                                }
                                .offset(y: offsets)
                            }
                        }
                        .overlay(alignment: .trailing) {
                            if isSelect {
                                Button {
                                    //
                                } label: {
                                    plusButton()
                                }
                                .offset(x: offsets)
                            }
                        }
                        .overlay(alignment: .trailing) {
                            if isSelect {
                                Button {
                                    //
                                } label: {
                                    minusButton()
                                }
                                .offset(x: offsets + 22)
                            }
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.blue.opacity(0.3), lineWidth: 2.5)
                                .opacity(isSelect ? 1 : 0)
                        }
                }
            }
            .offset(x: cumulativeDrag.width + viewState.width, y: cumulativeDrag.height + viewState.height)
//            .scaleEffect(currentScale * finalScale)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        viewState = value.translation
                    }
                    .onEnded { value in
                        cumulativeDrag.width += value.translation.width
                        cumulativeDrag.height += value.translation.height
                        viewState = .zero
                    }
            )
            .simultaneousGesture(
                MagnificationGesture()
                    .onChanged { amount in
                        self.currentScale = amount
                    }
                    .onEnded { _ in
                        self.finalScale *= self.currentScale
                        self.currentScale = 1
                    }
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(UIColor.systemGray5))
        }
        .background(.background)
        .cornerRadius(12)
        .padding(.horizontal)
        .background(.secondary.opacity(0.1))
    }

    @ViewBuilder
    func plusButton() -> some View {
        ZStack {
            Circle()
                .frame(width: 32)
                .foregroundStyle(.background)
                .opacity(1)
                .blur(radius: 2)
            Circle()
                .frame(width: 22)
                .foregroundStyle(.blue)
                .opacity(0.1)
            Image(systemName: "plus")
                .foregroundStyle(.blue)
                .font(.system(size: 8))
                .bold()
        }
        .background{
            Circle()
                .frame(width: 44)
                .opacity(0.01)
        }
    }

    @ViewBuilder
    func aiButton() -> some View {
        ZStack {
            Circle()
                .frame(width: 32)
                .foregroundStyle(.background)
                .opacity(1)
                .blur(radius: 2)
            Circle()
                .frame(width: 22)
                .foregroundStyle(.blue)
                .opacity(0.1)
            Image(systemName: "sparkles")
                .foregroundStyle(.blue)
                .font(.system(size: 11))
                .bold()
        }
    }
    
    @ViewBuilder
    func minusButton() -> some View {
        ZStack {
            Circle()
                .frame(width: 16)
                .foregroundStyle(.background)
                .opacity(1)
            Circle()
                .frame(width: 12)
                .foregroundStyle(.blue)
            Image(systemName: "minus")
                .foregroundStyle(.white)
                .font(.system(size: 6))
                .bold()
        }
    }
}

#Preview {
    AiContentView()
}
