//
//  MovieDetailsWireframe.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//
//

import UIKit

class MovieDetailsWireframe {
     weak var view: UIViewController!
}

extension MovieDetailsWireframe: MovieDetailsWireframeInput {
    
        
    func getMainView(_ data: Any?) -> UIViewController {
        let movieId = data as? Int
        let service = MovieDetailsService()
        let interactor = MovieDetailsInteractor(service: service)
        let presenter = MovieDetailsPresenter()
        let viewController = viewControllerFromCode(of: MovieDetailsViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        presenter.movieId = movieId
        self.view = viewController
        return viewController
    }
}
