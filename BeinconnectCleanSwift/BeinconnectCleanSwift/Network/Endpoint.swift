//
//  Endpoint.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

public typealias HTTPHeaders = [String: String]

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ParametersEncoding {
    case url
    case body
}

protocol EndPoint {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
    var headers: HTTPHeaders? { get }
    var parameters: [String: String]? { get }
    var parametersEncoding: ParametersEncoding? { get }
}
