//
//  ContentView.swift
//  PocketGallery
//
//  Created by alfeng on 1/16/25.
//

import SwiftUI
import FirebaseAuth

struct RootView: View {
    @State private var loadScreen = true
    @State private var isSignedIn: Bool
    @State private var userID: String
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var exhibitionViewModel: ExhibitionViewModel
    
    init() {
        _isSignedIn = State(initialValue: Auth.auth().currentUser != nil)
        if let uid = Auth.auth().currentUser?.uid {
            userID = uid
        } else {
            userID = ""
        }
    }

    var body: some View {
        Group {
            if loadScreen {
                 LoadingView()
                    .transition(.opacity)
            } else {
                if isSignedIn {
                    MainTabView(isSignedIn: $isSignedIn, userId: $userID)
                        .environmentObject(exhibitionViewModel)
                        .environmentObject(authViewModel)
                } else {
                    LoginView(isSignedIn: $isSignedIn)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    loadScreen.toggle()
                }
            }
            
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AuthViewModel())
        .environmentObject(ExhibitionViewModel())
}
