//
//  NowPlayingViewModel.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 06/05/23.
//

import SwiftUI

class NowPlayingViewModel: ObservableObject {
    @Published var listNowPlaying: [NowPlaying] = []
    @Published var loading = true

    var apiService: ApiService = .shared

    func loadAllNowPlaying() {
        apiService.get(
            type: NowPlayingList.self,
            endpoint: .getNowPlaying) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.listNowPlaying = response.results
                    self.loading = false
                case .failure(let error):
                    print(error)
                }
            }
    }
}
