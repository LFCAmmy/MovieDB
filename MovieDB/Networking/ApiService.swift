//
//  ApiService.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import UIKit
import Alamofire
import SwiftyJSON


class ApiService {
    public static let shared: ApiService = ApiService()
    
    let sessionManager: Session!
    
    init() {
        
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        sessionManager = Alamofire.Session(configuration: configuration)
    }
    
    class func handleError(error: AFError) -> NetworkError {
        
        Log.add(info: error.localizedDescription)
        
        switch error {
        case .sessionTaskFailed:
            return NetworkError.sessionOut
        default:
            if error.isInvalidURLError {
                return NetworkError.invalidURL
            } else {
                return NetworkError.decodingError(error)
            }
        }
    }
    
    class func sendRequests(toApi api: Api, onSuccess: @escaping (_ statusCode: Int, _ data: JSON)->(), onError: @escaping (NetworkError)->()) {
       
        ApiService.shared.sessionManager.request(api.url, method: api.httpMethod, parameters: api.parameters, encoding: api.encoding, headers: api.headers?.convertToHTTPHeaders()).response { (response) in
            
            Log.start(info: api.url)
            Log.add(info: "Request Parameter: \(String(describing: api.parameters))")
            Log.add(info: "Request Headers: \(String(describing: api.headers))")
            Log.add(info: "Request Method: \(api.httpMethod)")
            Log.add(info: "Request Response Status: \(response.response?.statusCode ?? 0)")
            
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode, let data = data else {
                    var errorModel = NetworkError.noData
                    onError(errorModel)
                    return
                }
                Log.add(info: "Data: \(JSON(data))")
                let jsonData = JSON(data)
                switch statusCode {
                case 200...299:
                    onSuccess(statusCode, jsonData)
                default:
                    var errorModel = NetworkError.noData
                    onError(errorModel)
                }
                
            case .failure(let error):
            var errorModel = NetworkError.unknown(error)
                
                guard let statusCode = response.response?.statusCode else {
                    if error.isInvalidURLError {
                        errorModel = NetworkError.invalidURL
                        
                    } else {
                        errorModel =  NetworkError.decodingError(error)
                    }
                    onError(errorModel)
                    return
                }
                
                errorModel = self.validateResponse(statusCode: statusCode)
                
                onError(errorModel)
            }
        }
    }
    
    class func validateResponse(statusCode: Int) -> NetworkError {
        switch statusCode {
        case 401:
            Log.add(info: "Unauthorized request - Check API key")
            return NetworkError.unauthorized
        case 400...499, 500...599:
            Log.add(info: "Server error: \(statusCode)")
            return NetworkError.serverError(statusCode: statusCode)
        default:
            Log.add(info: "Unexpected status code: \(statusCode)")
            return NetworkError.unknown(NSError(domain: "Unexpected status code", code: statusCode))
        }
    }
    
}
