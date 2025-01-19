//
//  Extensions.swift
//  PocketGallery
//
//  Created by alfeng on 1/19/25.
//

import Foundation

extension String {
    func truncated(to length: Int, addEllipsis: Bool = true) -> String {
        if self.count > length {
            let index = self.index(self.startIndex, offsetBy: length)
            let substring = self[..<index]
            return addEllipsis ? "\(substring)..." : String(substring)
        }
        return self
    }
}
