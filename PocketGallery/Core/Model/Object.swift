//
//  Object.swift
//  PocketGallery
//
//  Created by alfeng on 1/18/25.
//

import Foundation

struct ObjectResponse: Decodable {
    let records: [Object]
}

struct Object: Decodable {
    let id: Int
    let description: String?
    let medium: String?
    let title: String
    let dateend: Int
    let people: [Person]?
    
    var exhibitionId: Int
    var isLiked: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id, description, medium, title, dateend, people
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        medium = try container.decode(String.self, forKey: .medium)
        title = try container.decode(String.self, forKey: .title)
        dateend = try container.decode(Int.self, forKey: .dateend)
        people = try container.decode([Person].self, forKey: .people)

        exhibitionId = -1
        isLiked = false
    }
}

struct Person: Decodable {
    let name: String
    let personid: Int // could potentially be used for person pages
}
