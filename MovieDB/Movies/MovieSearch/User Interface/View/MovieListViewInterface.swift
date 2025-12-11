//
//  MovieListViewInterface.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

protocol MovieListViewInterface: class {
    func didFetchMovies(movies: MovieList)
    func didFetchSearchedMovies(movies: MovieList)
    func didFailWithError(error: Error)
}
