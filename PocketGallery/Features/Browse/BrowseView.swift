//
//  BrowseView.swift
//  PocketGallery
//
//  Created by alfeng on 1/19/25.
//

import SwiftUI

struct BrowseView: View {
    @Binding var isSignedIn: Bool
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var exhibitionViewModel: ExhibitionViewModel

    var body: some View {
        NavigationStack {
            HStack {
                Text("Handmade by Heels")
                    .font(.title).bold()
                NavigationLink {
//                    ProfileView(isSignedIn: $isSignedIn)
                } label: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(Color(red: 75/255, green: 156/255, blue: 211/255))
                }
            }
            ScrollView {
                ForEach(exhibitionViewModel.exhibitions, id: \.id) { product in
                    Text(product.title)
                }
                .padding(.horizontal, 15)
            }
            Spacer()
        }
    }
}

#Preview {
    BrowseView(isSignedIn: .constant(true))
        .environmentObject(AuthViewModel())
        .environmentObject(ExhibitionViewModel())
}
