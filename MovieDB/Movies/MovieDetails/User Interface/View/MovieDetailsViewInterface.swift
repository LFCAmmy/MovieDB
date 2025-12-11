//
//  MovieDetailsViewInterface.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//
//

protocol MovieDetailsViewInterface: class {
    func didFetchMovieDetail(movie: Movie)
    func didFailWithError(error: Error)
}
