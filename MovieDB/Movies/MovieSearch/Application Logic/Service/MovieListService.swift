//
//  MovieListService.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class MovieListService: MovieListServiceType {
    
    func fetchMovies(completionHandler: @escaping ((Result <MovieList, Error>) -> Void)) {
        ApiService.sendRequests(toApi: MovieAPI.getMovieList(page: 1)) { statusCode, data in
            switch statusCode {
            case 200...299:
                let data = MovieList(json: data)
                completionHandler(.success(data))
            default:
                completionHandler(.failure(NetworkError.noData))
            }
        } onError: { error in
            completionHandler(.failure(error))
        }
    }
    
    func fetchSearchedMovies(query:String, completionHandler: @escaping ((Result <MovieList, Error>) -> Void)) {
        ApiService.sendRequests(toApi: MovieAPI.getSearchMovie(query: query, page: 1)) { statusCode, data in
            switch statusCode {
            case 200...299:
                let data = MovieList(json: data)
                completionHandler(.success(data))
            default:
                completionHandler(.failure(NetworkError.noData))
            }
        } onError: { error in
            completionHandler(.failure(error))
        }
    }
}
