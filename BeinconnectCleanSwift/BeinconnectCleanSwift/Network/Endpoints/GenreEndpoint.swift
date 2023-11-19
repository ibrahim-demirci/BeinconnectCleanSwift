//
//  MovieEndpoint.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

enum GenreEndpoint {
    case getMovieGenres
}

extension GenreEndpoint: EndPoint {
    
    var path: String {
        "genre/movie/list"
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
        return nil
    }
    
    var parameters: [String : String]? {
        return ["api_key": API.apiKey, "language": API.locale]
    }
    
    var parametersEncoding: ParametersEncoding? {
        return .url
    }
}
