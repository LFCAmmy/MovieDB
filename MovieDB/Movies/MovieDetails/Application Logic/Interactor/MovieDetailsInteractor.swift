//
//  MovieDetailsInteractor.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//
//

import Foundation

class MovieDetailsInteractor {
    
	// MARK: Properties
    
    weak var output: MovieDetailsInteractorOutput?
    private let service: MovieDetailsServiceType
    
    // MARK: Initialization
    
    init(service: MovieDetailsServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: MovieDetails interactor input interface

extension MovieDetailsInteractor: MovieDetailsInteractorInput {
    func fetchMovieDetail(id: Int) {
        service.fetchMovieDetail(id: id) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movie):
                self.output?.didFetchMovieDetail(movie: movie)
            case .failure(let error):
                self.output?.didFailWithError(error: error)
            }
        }
    }
}
