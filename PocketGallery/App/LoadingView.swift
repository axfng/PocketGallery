//
//  LoadingView.swift
//  PocketGallery
//
//  Created by alfeng on 1/19/25.
//

import SwiftUI

struct LoadingView: View {
    @State private var offsetX: CGFloat = 0
    @State private var offsetX1: CGFloat = 0
    @State private var opacity: Double = 0.8

    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image("HAM-LOGO")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(x: offsetX)
                    .animation(.easeInOut(duration: 1), value: offsetX)
                
                VStack{
                    Text("Pocket")
                        .offset(x: offsetX1)
                        .animation(.easeInOut(duration: 1), value: offsetX1)
                        .font(.largeTitle.bold())
                    Text("Gallery")
                        .offset(x: offsetX1) // Apply the offset
                        .animation(.easeInOut(duration: 1), value: offsetX1)
                        .font(.largeTitle.bold())
                }
            }
            .opacity(opacity)
            .onAppear {
                offsetX = -UIScreen.main.bounds.width / 7
                offsetX1 = UIScreen.main.bounds.width / 4.4
                withAnimation(.easeIn(duration: 1)){
                    opacity = 1.0
                }
            }
            Spacer()
            
        }
    }
}

#Preview {
    LoadingView()
}
