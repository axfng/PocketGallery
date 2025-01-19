//
//  MainTabView.swift
//  PocketGallery
//
//  Created by alfeng on 1/19/25.
//

import SwiftUI

struct MainTabView: View {
    @Binding var isSignedIn: Bool
    @Binding var userId: String
    
    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Label("Home", systemImage: "photo.artframe")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MainTabView(isSignedIn: .constant(true), userId: .constant("UAOrPcizD3VHqaepr9E3CGHr4Aq2"))
}
