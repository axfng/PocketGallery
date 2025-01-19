//
//  Exhibition.swift
//  PocketGallery
//
//  Created by alfeng on 1/18/25.
//

import Foundation

struct ExhibitionResponse: Decodable {
    let records: [Exhibition]
}

struct Exhibition: Decodable {
    let id: Int
    let title: String
    let exhibitionid: Int
    let primaryimageurl: String?
    let htmldescription: String?
}
