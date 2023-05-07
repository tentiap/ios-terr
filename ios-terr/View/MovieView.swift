//
//  MovieView.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 05/05/23.
//

import SwiftUI

enum MovieType {
    case nowPlaying
    case popular
    case upcoming
}

struct MovieView: View {
    @State var movieType: MovieType = .nowPlaying

    var body: some View {
        NavigationView {
            VStack {
                Picker("Movie Type", selection: $movieType) {
                    Text("Now Playing").tag(MovieType.nowPlaying)
                    Text("Popular").tag(MovieType.popular)
                    Text("Upcoming").tag(MovieType.upcoming)
                }
                .pickerStyle(SegmentedPickerStyle())

                if movieType == .nowPlaying {
                    NowPlayingView()
                } else if movieType == .popular {
                    PopularView()
                } else {
                    UpcomingView()
                }
            }
            .navigationBarTitle(
                Text("Movies"),
                displayMode: .inline)
            .padding()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
