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
    private var cancellable: AnyCancellable?
    private let service: ObjectService
    private let exhibitionId: Int

    init(service: ObjectService, exhibitionId: Int) {
        self.service = service
        self.exhibitionId = exhibitionId
    }

    func loadObjects() {
        cancellable = service.fetchObjects(forExhibitionId: exhibitionId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching objects: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.objects = response.records
            })
    }
}
