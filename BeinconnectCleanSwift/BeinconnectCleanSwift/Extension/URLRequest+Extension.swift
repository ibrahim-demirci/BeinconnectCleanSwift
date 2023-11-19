//
//  URLRequest+Extension.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation


extension URLRequest {
    
    init(endpoint: EndPoint) {
        
        var component = URLComponents(string: endpoint.url!.absoluteString)!
        
        if let parameters = endpoint.parameters, let encoding = endpoint.parametersEncoding {
            if encoding == .url {
                component.queryItems = parameters.map { (key, value) in
                    URLQueryItem(name: key, value: value)
                }
            }
        }

        self.init(url: component.url!)

    }
    
    func log() {
        
            print("\(httpMethod ?? "") \(self)")
            if let allHTTPHeaderFields = allHTTPHeaderFields {
                print("HEADERS \n \(allHTTPHeaderFields)")
            }
            if let body = httpBody?.log() {
                print("BODY \n \(body)")
            }
        }
}
