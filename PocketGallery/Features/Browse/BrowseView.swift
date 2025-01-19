//
//  BrowseView.swift
//  PocketGallery
//
//  Created by alfeng on 1/19/25.
//

import SwiftUI

struct BrowseView: View {
    @Binding var isSignedIn: Bool
    
    @StateObject var browseViewModel = BrowseViewModel()
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var exhibitionViewModel: ExhibitionViewModel
    @EnvironmentObject var objectViewModel: ObjectViewModel

    var body: some View {
        NavigationStack {
            HStack {
                Text("Browse")
                    .font(.title).bold()
                
                Spacer()
                
                NavigationLink {
//                    ProfileView(isSignedIn: $isSignedIn)
                } label: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(Color(red: 75/255, green: 156/255, blue: 211/255))
                }
            }
            HStack {
                TextField("Search for Items", text: $browseViewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundStyle(.black)
            }
            
            ScrollView {
                ForEach(browseViewModel.filteredExhibitions, id: \.id) { exhibition in
                    ExhibitionPreView(exhibition: exhibition)
                        .environmentObject(objectViewModel)
                        .padding(.top, 10)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 15)
        .onAppear {
            browseViewModel.filterExhibitions(exhibitions: exhibitionViewModel.exhibitions)
        }
        .onChange(of: browseViewModel.searchText) {
            browseViewModel.filterExhibitions(exhibitions: exhibitionViewModel.exhibitions)
        }

    }
}

#Preview {
    BrowseView(isSignedIn: .constant(true))
        .environmentObject(AuthViewModel())
        .environmentObject(ExhibitionViewModel())
        .environmentObject(ObjectViewModel())
}
