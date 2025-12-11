//
//  NetworkDefaults.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation

func getDefaultHttpHeaders() -> [String: String] {
    let defaultHeaders: Headers = [
        "Content-Type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MTdiZmEwOThkNTAxZDRjNWNhM2RlZjhiZjJmYjE4MyIsIm5iZiI6MTUzMDAwMTY2Ny4yNDEsInN1YiI6IjViMzFmOTAzYzNhMzY4NTMyMDAwYTRiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EYXNcpJgNl6wYbemxeaP0K2NuVfURLUxLQlJB_tMnyU"
    ]
    
    return defaultHeaders
}

