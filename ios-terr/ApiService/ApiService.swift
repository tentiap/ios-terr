//
//  ApiService.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 06/05/23.
//

import Foundation
import Alamofire

class ApiService {
    static let shared = ApiService()

    func get<T: Decodable>(
        type: T.Type,
        endpoint: Endpoints,
        completion: @escaping (Result<T, Error>) -> ()
    ) {
        AF.request(
            endpoint.url,
            method: .get)
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    let decoded = try! JSONDecoder().decode(type.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decoded))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
        }
    }
}
