//
//  MovieRow.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 06/05/23.
//

import SwiftUI
import URLImage

struct NowPlayingRow: View {
    var movie: NowPlaying

    var body: some View {
        HStack {
            let baseURL = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURL + movie.posterPath)

            if let urlImage = posterURL {
                URLImage(urlImage) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 180)
                }
            }

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.system(size: 18))
                    .bold()
                HStack {
                    Text("🗓️")
                    if let formattedDate = Date().formatDate(from: movie.releaseDate) {
                        Text(formattedDate)
                            .font(.system(size: 15))
                    } else {
                        Text("Release Date")
                            .font(.system(size: 15))
                    }
                }
                HStack {
                    Text("⭐️")
                    Text(String(movie.voteAverage))
                        .font(.system(size: 15))
                }
            }
        }
    }
}

