//
//  PopularView.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import SwiftUI

struct PopularView: View {
    @ObservedObject var popularVM = PopularViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if popularVM.loading {
                    ProgressView()
                    Text("Loading")
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else if popularVM.listPopular.isEmpty {
                    Text("No Data")
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else {
                    List(popularVM.listPopular) { popular in
                        NavigationLink(
                            destination: DetailNowPlayingView(idMovie: popular.id)
                        ) {
                            PopularRow(movie: popular)
                                .padding(.vertical, 8)
                        }
                    }
                }
            }.onAppear {
                popularVM.loadAllPopular()
            }
        }
    }
}
