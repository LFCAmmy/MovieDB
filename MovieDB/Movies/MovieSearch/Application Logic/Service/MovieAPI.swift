//
//  MovieAPI.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation
import Alamofire
//import SwiftyUserDefaults

enum MovieAPI: Api {
    
    case getMovieList(page: Int)
    case getMovieDetails(id: Int)
    case getSearchMovie(query: String, page: Int)
    
    var url: String {
        switch self {
        case .getMovieList(let page):
            return baseUrl + "discover/movie?include_adult=false&include_video=false&language=en-US&page=\(page)"
        case .getMovieDetails(let id):
            return baseUrl + "movie/\(id)"
        case .getSearchMovie(let query, let page):
            return baseUrl + "search/movie?query=\(query)&include_adult=false&language=en-US&page=\(page)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
        
    var headers: Headers? {
        var defaultHeaders = getDefaultHttpHeaders()
        switch self {
        default:
            return defaultHeaders
        }
    }
}
