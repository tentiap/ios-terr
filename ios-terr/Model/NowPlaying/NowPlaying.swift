//
//  NowPlaying.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 06/05/23.
//

import Foundation

struct NowPlayingList: Decodable {
    let results: [NowPlaying]
}

struct NowPlaying: Codable, Identifiable {
    let id: Int
    let title, releaseDate, posterPath: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
    }
}
