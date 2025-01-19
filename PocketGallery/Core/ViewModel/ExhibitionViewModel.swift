//
//  ExhibitionViewModel.swift
//  PocketGallery
//
//  Created by alfeng on 1/18/25.
//

import Foundation
import Combine

class ExhibitionViewModel: ObservableObject {
    @Published var exhibitions: [Exhibition] = []
    private var cancellable: AnyCancellable?
    private let service: ExhibitionService

    init() {
        self.service = ExhibitionService()
        loadExhibitions()
    }

    func loadExhibitions() {
        cancellable = service.fetchExhibitions()
            .map { response in
                response.records.filter { $0.description != nil }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching exhibitions: \(error)")
                }
            }, receiveValue: { [weak self] filteredExhibitions in
                self?.exhibitions = filteredExhibitions
            })
    }
}
