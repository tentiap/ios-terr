//
//  Extension.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 06/05/23.
//

import Foundation

extension Date {
    func formatDate(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.string(from: date)
    }

    func formatCreateDate(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.string(from: date)
    }
}

