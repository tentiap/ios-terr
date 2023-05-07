//
//  NowPlayingView.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 06/05/23.
//

import SwiftUI

struct NowPlayingView: View {
    @ObservedObject var nowPlayingVM = NowPlayingViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if nowPlayingVM.loading {
                    ProgressView()
                    Text("Loading")
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else if nowPlayingVM.listNowPlaying.isEmpty {
                    Text("No Data")
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else {
                    List(nowPlayingVM.listNowPlaying) { np in
                        NavigationLink(
                            destination: DetailNowPlayingView(idMovie: np.id)
                        ) {
                            NowPlayingRow(movie: np)
                                .padding(.vertical, 8)
                        }
                    }
                }
            }.onAppear {
                nowPlayingVM.loadAllNowPlaying()
            }
        }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}
