//
//  Movie.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation
import SwiftyJSON

struct MovieList {
    var page: Int?
    var results: [Movie]?
    
    init(json: JSON) {
        page = json["page"].int
        if let movies = json["results"].array {
            self.results = movies.map { Movie(json: $0) }
        }
    }
}

struct Movie {
    var id: Int?
    var posterPath: String?
    var backdropPath: String?
    var originalTitle: String?
    var overview: String?
    var releaseDate: String?
    var tagline: String?
    var voteAverage: Double?
    var budget: Int?
    var revenue: Int?
    var runtime: Int?
    
    init(json: JSON) {
        id = json["id"].int
        posterPath = json["poster_path"].string
        backdropPath = json["backdrop_path"].string
        originalTitle = json["original_title"].string
        overview = json["overview"].string
        releaseDate = json["release_date"].string
        tagline = json["tagline"].string
        voteAverage = json["vote_average"].double
        budget = json["budget"].int
        revenue = json["revenue"].int
        runtime = json["runtime"].int
    }
    
    var imageUrl: String {
        guard let posterPath else { return ""}
        return "https://image.tmdb.org/t/p/w200\(posterPath)"
    }
    
    var backdropImageUrl: String {
        guard let backdropPath else { return ""}
        return "https://image.tmdb.org/t/p/original/\(backdropPath)"
    }
}
