//
//  MainTabView.swift
//  PocketGallery
//
//  Created by alfeng on 1/19/25.
//

import SwiftUI
import Combine


struct MainTabView: View {
    @Binding var isSignedIn: Bool
    @Binding var userId: String
    private var cancellableSet: Set<AnyCancellable> = []
    
    @StateObject private var objectViewModel = ObjectViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var exhibitionViewModel: ExhibitionViewModel
    
    public init(isSignedIn: Binding<Bool>, userId: Binding<String>) {
        self._isSignedIn = isSignedIn
        self._userId = userId
    }
    
    var body: some View {
        TabView {
            BrowseView(isSignedIn: $isSignedIn)
                .tabItem {
                    Label("Browse", systemImage: "photo.artframe")
                }
                .environmentObject(authViewModel)
                .environmentObject(exhibitionViewModel)
                .environmentObject(objectViewModel)
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .onReceive(exhibitionViewModel.$exhibitions) { exhibitions in
                    print("Received new exhibitions count: \(exhibitions.count)")
                    if !exhibitions.isEmpty {
                        objectViewModel.loadObjects(from: exhibitions)
                    }
                }
    }
}

#Preview {
    MainTabView(isSignedIn: .constant(true), userId: .constant("UAOrPcizD3VHqaepr9E3CGHr4Aq2"))
        .environmentObject(AuthViewModel())
        .environmentObject(ExhibitionViewModel())
}
