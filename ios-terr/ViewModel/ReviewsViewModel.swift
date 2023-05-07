//
//  ReviewsViewModel.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import SwiftUI

class ReviewsViewModel: ObservableObject {
    @Published var listReview: [Review] = []
    @Published var loading = true

    var apiService: ApiService = .shared

    func loadAllReviews(with id: Int) {
        apiService.get(
            type: ReviewList.self,
            endpoint: .getReviews(id)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.listReview = response.results
                    self.loading = false
                case .failure(let error):
                    print(error)
                }
            }
    }
}
