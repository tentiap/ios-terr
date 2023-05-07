//
//  Endpoints.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 06/05/23.
//

import Foundation

enum Endpoints {
    case getNowPlaying
    case getUpcoming
    case getPopular
    case getDetail(Int)
    case getReviews(Int)

    var url: URL {
        switch self {
        case .getNowPlaying:
            return URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f830b35d544c44636e817f47742b9e82")!
        case .getPopular:
            return URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=f830b35d544c44636e817f47742b9e82")!
        case .getUpcoming:
            return URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=f830b35d544c44636e817f47742b9e82")!
        case .getDetail(let id):
            return URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=f830b35d544c44636e817f47742b9e82")!
        case .getReviews(let id):
            return URL(string:
                "https://api.themoviedb.org/3/movie/\(id)/reviews?api_key=f830b35d544c44636e817f47742b9e82")!
        }
    }
}
