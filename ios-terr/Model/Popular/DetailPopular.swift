//
//  DetailPopular.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import Foundation

struct DetailPopular: Codable, Identifiable {
    let genres: [Genre]
    let homepage: String
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let posterPath: String
    let releaseDate: String
    let runtime: Int
    let status, title: String

    enum CodingKeys: String, CodingKey {
        case genres, homepage, id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case status, title
    }
}


