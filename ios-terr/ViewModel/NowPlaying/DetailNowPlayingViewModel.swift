//
//  DetailNowPlayingViewModel.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import SwiftUI
class DetailNowPlayingViewModel: ObservableObject {
    @Published var detailMovie: DetailNowPlaying?
    @Published var loading = true

    var apiService: ApiService = .shared

    func getDetailNowPlaying(with id: Int) {
        apiService.get(
            type: DetailNowPlaying.self,
            endpoint: .getDetail(id)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.detailMovie = response
                    self.loading = false
                case .failure(let error):
                    print(error)
                }
            }
    }
}

