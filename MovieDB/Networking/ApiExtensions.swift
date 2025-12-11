//
//  ApiExtensions.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation
import Alamofire

extension Api {
    
    var baseUrl: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var encoding: ParameterEncoding { JSONEncoding.default }
    var parameters: [String: Any]? { nil }
        
    var headers: Headers? { getDefaultHttpHeaders() }
    
    // default value is false so we dont have to accomodate for other apis
    var isEmptyResponse: Bool { false }
    
    
}

