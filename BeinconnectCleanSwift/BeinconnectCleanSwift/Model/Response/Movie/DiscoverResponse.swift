//
//  DiscoverResponse.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

struct DiscoverResponse: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
