//
//  MovieListWireframe.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

import UIKit

class MovieListWireframe {
     weak var view: UIViewController!
    private lazy var movieDetailWireframe : MovieDetailsWireframe = { MovieDetailsWireframe() }()
}

extension MovieListWireframe: MovieListWireframeInput {
    func getMainView(_ data: Any?) -> UIViewController {
        let service = MovieListService()
        let interactor = MovieListInteractor(service: service)
        let presenter = MovieListPresenter()
        let viewController = viewControllerFromCode(of: MovieListViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func openMovieDetails(id: Int) {
        let vc = movieDetailWireframe.getMainView(id)
        pushMainView(on: vc)
    }
}
