//
//  ObjectViewModel.swift
//  PocketGallery
//
//  Created by alfeng on 1/18/25.
//

import Foundation
import Combine

class ObjectViewModel: ObservableObject {
    @Published var objects: [Object] = []
    private var cancellables: Set<AnyCancellable> = []
    private let service: ObjectService = ObjectService()
    
    func loadObjects(from exhibitions: [Exhibition]) {
       print("Starting to load objects for \(exhibitions.count) exhibitions")
       exhibitions.forEach { exhibition in
           loadObjects(forExhibitionId: exhibition.id)
       }
    }

    private func loadObjects(forExhibitionId exhibitionId: Int) {
       print("Requesting objects for exhibition ID \(exhibitionId)")
        service.fetchObjects(forExhibitionId: exhibitionId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching objects for exhibition \(exhibitionId): \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.objects.append(contentsOf: response.records)
            })
            .store(in: &cancellables)
    }
}
