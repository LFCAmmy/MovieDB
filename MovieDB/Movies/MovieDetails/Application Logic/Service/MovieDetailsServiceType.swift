//
//  MovieDetailsServiceType.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//
//

import Foundation

protocol MovieDetailsServiceType: class {
    func fetchMovieDetail(id: Int, completionHandler: @escaping ((Result <Movie, Error>) -> Void))
}
