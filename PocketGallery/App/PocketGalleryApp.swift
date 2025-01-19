//
//  PocketGalleryApp.swift
//  PocketGallery
//
//  Created by alfeng on 1/16/25.
//

import SwiftUI
import FirebaseCore

@main
struct PocketGalleryApp: App {
    @StateObject private var authViewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authViewModel)
        }
    }
}
