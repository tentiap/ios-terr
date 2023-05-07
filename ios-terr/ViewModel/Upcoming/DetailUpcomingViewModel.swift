//
//  DetailUpcomingViewModel.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import SwiftUI
class DetailUpcomingViewModel: ObservableObject {
    @Published var detailMovie: DetailUpcoming?
    @Published var loading = true

    var apiService: ApiService = .shared

    func getDetailUpcoming(with id: Int) {
        apiService.get(
            type: DetailUpcoming.self,
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

