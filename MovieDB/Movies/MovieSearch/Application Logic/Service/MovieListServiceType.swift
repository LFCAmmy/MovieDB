//
//  MovieListServiceType.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

import Foundation

protocol MovieListServiceType: class {
    func fetchMovies(completionHandler: @escaping ((Result <MovieList, Error>) -> Void))
    func fetchSearchedMovies(query:String, completionHandler: @escaping ((Result <MovieList, Error>) -> Void))
}
