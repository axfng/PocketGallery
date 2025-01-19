//
//  ObjectService.swift
//  PocketGallery
//
//  Created by alfeng on 1/18/25.
//

import Foundation
import Combine

class ObjectService {
    var apiKey: String = "576a392b-dad6-44b0-ad2c-de61710b0fd4"
    var baseUrl: String = "https://api.harvardartmuseums.org"

    func fetchObjects(forExhibitionId exhibitionId: Int) -> AnyPublisher<ObjectResponse, Error> {
        let url = URL(string: "\(baseUrl)/object?exhibitionid=\(exhibitionId)&apikey=\(apiKey)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ObjectResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
