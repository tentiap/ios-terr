//
//  UpcomingView.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 07/05/23.
//

import SwiftUI

struct UpcomingView: View {
    @ObservedObject var upcomingVM = UpcomingViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if upcomingVM.loading {
                    ProgressView()
                    Text("Loading")
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else if upcomingVM.listUpcoming.isEmpty {
                    Text("No Data")
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else {
                    List(upcomingVM.listUpcoming) { upcoming in
                        NavigationLink(
                            destination: DetailUpcomingView(idMovie: upcoming.id)
                        ) {
                            UpcomingRow(movie: upcoming)
                                .padding(.vertical, 8)
                        }
                    }
                }
            }.onAppear {
                upcomingVM.loadAllUpcoming()
            }
        }
    }
}

