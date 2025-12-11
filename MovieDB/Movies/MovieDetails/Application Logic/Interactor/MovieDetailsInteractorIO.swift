//
//  MovieDetailsInteractorIO.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//
//

protocol MovieDetailsInteractorInput: class {
    func fetchMovieDetail(id: Int)
}

protocol MovieDetailsInteractorOutput: class {
    func didFetchMovieDetail(movie: Movie)
    func didFailWithError(error: Error)
}
