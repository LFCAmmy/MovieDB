//
//  MovieListInteractor.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

import Foundation

class MovieListInteractor {
    
	// MARK: Properties
    
    weak var output: MovieListInteractorOutput?
    private let service: MovieListServiceType
    
    // MARK: Initialization
    
    init(service: MovieListServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: MovieList interactor input interface

extension MovieListInteractor: MovieListInteractorInput {
    func fetchMovies() {
        service.fetchMovies { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movies):
                self.output?.didFetchMovies(movies: movies)
            case .failure(let error):
                self.output?.didFailWithError(error: error)
            }
        }
    }
    
    func fetchSearchedMovie(query: String) {
        service.fetchSearchedMovies(query: query) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movies):
                self.output?.didFetchSearchedMovies(movies: movies)
            case .failure(let error):
                self.output?.didFailWithError(error: error)
            }
        }
    }
    
}
