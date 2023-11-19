//
//  APIManager.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

typealias ResultCompletion<T> = (CustomResult<T>) -> Void
typealias CustomResult<T> = Result<T?, CustomErrors>

final class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    static var sharedHeaders : HTTPHeaders {
        ["Content-Type": "application/json"]
    }
    
    func request<T: Codable>(endpoint: EndPoint, completion: @escaping ResultCompletion<T>) {
        
        BaseHelper.attachLoadingView()
        
        guard let _ = endpoint.url else {
            completion(.failure(.invalidURL))
            return
        }
                
        var request = URLRequest(endpoint: endpoint)
        request.log()
        
        if endpoint.parametersEncoding == .body , let parameters = endpoint.parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }
        
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            data?.log()
            BaseHelper.detachLodingView()
            
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
}
