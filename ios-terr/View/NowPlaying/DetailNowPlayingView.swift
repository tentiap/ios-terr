//
//  DetailNowPlayingView.swift
//  ios-terr
//
//  Created by Tenti Atika Putri on 06/05/23.
//

import SwiftUI
import URLImage

struct DetailNowPlayingView: View {
    var idMovie: Int

    @ObservedObject var viewModel = DetailNowPlayingViewModel()
    @ObservedObject var review = ReviewsViewModel()

    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                let baseURL = "https://image.tmdb.org/t/p/w500"
                let posterURL = URL(string: baseURL + (viewModel.detailMovie?.posterPath ?? ""))

                if let urlImage = posterURL {
                    URLImage(urlImage) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 0, y: 0)
                            .border(Color.gray.opacity(0.5))
                            .padding(.bottom, 0)
                            .frame(
                                width: UIScreen.main.bounds.height / 8 * 3,
                                height: UIScreen.main.bounds.height / 2)
                    }
                }

                HStack {
                    Text(viewModel.detailMovie?.originalTitle ?? "Unknown Title")
                        .bold()
                    Spacer()

                    let url = URL(string: "https://www.themoviedb.org/movie/\(viewModel.detailMovie?.id ?? 0)")
                    ShareLink(item: url!)
                }.padding(.bottom, 1)

                HStack {
                    if let homepageURL = URL(string: viewModel.detailMovie?.homepage ?? "") {
                        Link(destination: homepageURL) {
                            Text(viewModel.detailMovie?.homepage ?? "")
                                .underline()
                                .foregroundColor(.blue)
                        }
                    }
                }.padding(.bottom, 1)

                HStack {
                    let releaseDate = Date().formatDate(from: viewModel.detailMovie?.releaseDate ?? "") ?? ""
                    let originalLanguage = viewModel.detailMovie?.originalLanguage.uppercased() ?? ""
                    let runtime = viewModel.detailMovie?.runtime ?? 0
                    let status = viewModel.detailMovie?.status ?? ""
                    Text("\(releaseDate) (\(originalLanguage)) · \(runtime) min · \(status)")
                }.padding(.bottom, 1)

                HStack(spacing: 5) {
                    ForEach(viewModel.detailMovie?.genres ?? []) { genre in
                        Text(genre.name)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                }.padding(.bottom, 1)

                Text(viewModel.detailMovie?.overview ?? "No description for this movie")
                    .lineLimit(nil)

                Divider()

                Text("Reviews")
                    .font(.title)
                    .bold()

                Spacer()

                ForEach(review.listReview) { rev in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(rev.author)
                                    .font(.headline)

                                let reviewDate = Date().formatCreateDate(from: rev.createdAt) ?? ""
                                Text(reviewDate)
                            }
                        }
                        Text(rev.content)
                            .font(.body)
                        Divider()
                    }
                    .padding(.top, 10)
                }
            }
        }.onAppear {
            viewModel.getDetailNowPlaying(with: idMovie)
            review.loadAllReviews(with: idMovie)
        }
        .navigationBarTitle(
            Text(viewModel.detailMovie?.title ?? "Unknown Title"),
            displayMode: .inline)
        .padding()
    }
}

