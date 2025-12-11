//
//  MovieListPresenter.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

import Foundation

class MovieListPresenter {
    
	// MARK: Properties
    
    weak var view: MovieListViewInterface?
    var interactor: MovieListInteractorInput?
    var wireframe: MovieListWireframeInput?

    // MARK: Converting entities
}

 // MARK: MovieList module interface

extension MovieListPresenter: MovieListModuleInterface, ApiRequestPresentable {
    func fetchSearchedMovie(query: String) {
        interactor?.fetchSearchedMovie(query: query)
    }
    
    func fetchMovies() {
        showLoadingIndicator()
        interactor?.fetchMovies()
    }
    
    func openMovieDetails(id: Int) {
        wireframe?.openMovieDetails(id: id)
    }
}

// MARK: MovieList interactor output interface

extension MovieListPresenter: MovieListInteractorOutput {
    func didFetchSearchedMovies(movies: MovieList) {
        view?.didFetchSearchedMovies(movies: movies)
    }
    
    func didFetchMovies(movies: MovieList) {
        hideLoadingIndicator()
        view?.didFetchMovies(movies: movies)
    }
    
    func didFailWithError(error: Error) {
        hideLoadingIndicator()
        view?.didFailWithError(error: error)
    }
}
