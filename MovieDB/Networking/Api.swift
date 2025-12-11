//
//  Api.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation
import Alamofire
//import CryptoSwift

typealias Headers = [String: String]

protocol Api {
    
    var baseUrl: String {get}
    
    var url: String {get}
    
    var httpMethod: HTTPMethod {get}
    
    var encoding: ParameterEncoding {get}
    
    var parameters: [String: Any]? {get}
    
    var headers: Headers? {get}
    // this property is added to solve the null response issue. where the unwrapping of response would cause it to throw/call onError. hence Something went wrong/error message
    var isEmptyResponse: Bool {get}
}
