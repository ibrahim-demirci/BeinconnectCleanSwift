//
//  DiscoverEndpoint.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

enum DiscoverEndpoint {
    case getMoviesByGenre(id: Int)
}

extension DiscoverEndpoint: EndPoint {
    
    var path: String {
        "discover/movie"
    }
    
    var baseURL: String {
        API.baseURl
    }
    
    var url: URL? {
        URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        .get
    }
    
    var headers: HTTPHeaders? {
        APIManager.sharedHeaders
    }
    
    var parameters: [String : String]? {
        
        switch self {
        case .getMoviesByGenre(let id):
            return [
                "api_key":          API.apiKey,
                "language":         API.locale,
                "sort_by":          "popularity.desc",
                "include_adult":    "false",
                "include_video":    "false",
                "page":             "1",
                "with_genres":      "\(id)"
            ]
        }
    }
    
    var parametersEncoding: ParametersEncoding? {
        return .url
    }
}
