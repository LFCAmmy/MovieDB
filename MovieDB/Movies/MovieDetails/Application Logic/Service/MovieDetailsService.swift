//
//  MovieDetailsService.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//
//

import Foundation

class MovieDetailsService: MovieDetailsServiceType {
    
    func fetchMovieDetail(id: Int, completionHandler: @escaping ((Result <Movie, Error>) -> Void)) {
        ApiService.sendRequests(toApi: MovieAPI.getMovieDetails(id: id)) { statusCode, data in
            switch statusCode {
            case 200...299:
                let data = Movie(json: data)
                completionHandler(.success(data))
            default:
                completionHandler(.failure(NetworkError.noData))
            }
        } onError: { error in
            completionHandler(.failure(error))
        }
    }
}
