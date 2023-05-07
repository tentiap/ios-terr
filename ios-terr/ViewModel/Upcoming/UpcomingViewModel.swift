//
//  UpcomingViewModel.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import SwiftUI

class UpcomingViewModel: ObservableObject {
    @Published var listUpcoming: [Upcoming] = []
    @Published var loading = true

    var apiService: ApiService = .shared

    func loadAllUpcoming() {
        apiService.get(
            type: UpcomingList.self,
            endpoint: .getUpcoming) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.listUpcoming = response.results
                    self.loading = false
                case .failure(let error):
                    print(error)
                }
            }
    }
}
