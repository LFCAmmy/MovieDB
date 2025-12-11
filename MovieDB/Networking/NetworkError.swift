//
//  NetworkError.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case noData
    case decodingError(Error)
    case serverError(statusCode: Int)
    case unauthorized
    case unknown(Error)
    case sessionOut
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received from server"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)"
        case .unauthorized:
            return "Unauthorized. Check API key"
        case .unknown(let error):
            return "\(error.localizedDescription)"
        case .sessionOut:
            return "Request time out"
        }
    }
}
