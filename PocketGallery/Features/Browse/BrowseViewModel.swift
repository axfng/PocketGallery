//
//  BrowseViewModel.swift
//  PocketGallery
//
//  Created by alfeng on 1/19/25.
//

import Foundation
import Combine

class BrowseViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var filteredExhibitions: [Exhibition] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    func filterExhibitions(exhibitions: [Exhibition]) {
        if searchText.isEmpty {
            filteredExhibitions = exhibitions
        } else {
            filteredExhibitions = exhibitions.filter { exhibition in
                exhibition.title.localizedStandardContains(searchText)
            }
        }
    }
}
