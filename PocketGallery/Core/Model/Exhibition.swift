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
    let description: String?
    let begindate: String?
    let enddate: String?
}

extension Exhibition {
    var beginDateFormatted: Date? {
        return DateFormatter.displayFormat.date(from: begindate ?? "")
    }
    
    var endDateFormatted: Date? {
        return DateFormatter.displayFormat.date(from: enddate ?? "")
    }
}

extension DateFormatter {
    static let displayFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // Changed to match the input format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let displayFormatForUI: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d" // Same format for display
        formatter.locale = Locale(identifier: "en_US_POSIX") // Ensures English month names
        return formatter
    }()
}
