//
//  PopularViewModel.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import SwiftUI

class PopularViewModel: ObservableObject {
    @Published var listPopular: [Popular] = []
    @Published var loading = true

    var apiService: ApiService = .shared

    func loadAllPopular() {
        apiService.get(
            type: PopularList.self,
            endpoint: .getPopular) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.listPopular = response.results
                    self.loading = false
                case .failure(let error):
                    print(error)
                }
            }
    }
}
