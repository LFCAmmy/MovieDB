//
//  MovieDetailsViewController.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//
//

import UIKit

class MovieDetailsViewController: RootViewController {
    
    // MARK: Properties
    
    var presenter: MovieDetailsModuleInterface?
    
    // MARK: IBOutlets
    let movieDetailView = MovieDetailsView()
    
    // MARK: VC's Life cycle
    
    override func loadView() {
        view = movieDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTransparentNavigationBar()
        presenter?.viewDidLoad()
    }
}

// MARK: MovieDetailsViewInterface
extension MovieDetailsViewController: MovieDetailsViewInterface {
    func didFetchMovieDetail(movie: Movie) {
        movieDetailView.config(movie: movie)
    }
    
    func didFailWithError(error: any Error) {
        self.showToastMessage(message: error.localizedDescription)
    }
}
