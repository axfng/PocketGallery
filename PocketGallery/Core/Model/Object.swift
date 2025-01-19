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
    let medium: String
    let title: String
    let dateend: Int
    let people: [Person]
}

struct Person: Decodable {
    let name: String
    let personid: Int // could potentially be used for person pages
}
