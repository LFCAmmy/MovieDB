//
//  MovieDetailsPresenter.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//
//

import Foundation

class MovieDetailsPresenter {
    var movieId: Int?
	// MARK: Properties
    
    weak var view: MovieDetailsViewInterface?
    var interactor: MovieDetailsInteractorInput?
    var wireframe: MovieDetailsWireframeInput?

    // MARK: Converting entities
}

 // MARK: MovieDetails module interface

extension MovieDetailsPresenter: MovieDetailsModuleInterface, ApiRequestPresentable{
    func viewDidLoad() {
        guard let id = movieId else { return }
        showLoadingIndicator()
        interactor?.fetchMovieDetail(id: id)
    }
}

// MARK: MovieDetails interactor output interface

extension MovieDetailsPresenter: MovieDetailsInteractorOutput {
    func didFetchMovieDetail(movie: Movie) {
        hideLoadingIndicator()
        view?.didFetchMovieDetail(movie: movie)
    }
    
    func didFailWithError(error: any Error) {
        hideLoadingIndicator()
        view?.didFailWithError(error: error)
    }
    
    
}
