//
//  SharedExtensions.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation
import Alamofire

extension Dictionary where Key == String, Value == String {
    
    func convertToHTTPHeaders() -> HTTPHeaders {
        let filteredHeader = self.compactMapValues { $0 }.filter { !$0.value.isEmpty }
        return HTTPHeaders(filteredHeader)
    }
}
