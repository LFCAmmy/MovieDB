//
//  MovieListInteractorIO.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

protocol MovieListInteractorInput: class {
    func fetchMovies()
    func fetchSearchedMovie(query: String)
}

protocol MovieListInteractorOutput: class {
    func didFetchMovies(movies: MovieList)
    func didFetchSearchedMovies(movies: MovieList)
    func didFailWithError(error: Error)
}
