//
//  MovieListModuleInterface.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

protocol MovieListModuleInterface: class {
    func fetchMovies()
    func fetchSearchedMovie(query: String)
    func openMovieDetails(id: Int)
}
