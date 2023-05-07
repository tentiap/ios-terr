//
//  Review.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import Foundation

struct ReviewList: Decodable {
    let results: [Review]
}

struct Review: Codable, Identifiable {
    let id, author, content, createdAt, url: String

    enum CodingKeys: String, CodingKey {
        case id, author, content, url
        case createdAt = "created_at"
    }
}
