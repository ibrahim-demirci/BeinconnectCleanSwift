//
//  MoviesWorker.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation


class MoviesWorker {
    
    func getGenres(completion: @escaping (CustomResult<GenresResponse>) -> Void) {
        APIManager.shared.request (
            endpoint: GenreEndpoint.getMovieGenres) { (result: CustomResult<GenresResponse>) in
                switch result {
                case .success(let genres):
                    completion(.success(genres))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getMoviesAtSection(id: Int, completion: @escaping (CustomResult<DiscoverResponse>) -> Void) {
        APIManager.shared.request (
            endpoint: DiscoverEndpoint.getMoviesByGenre(id: id)) { (result: CustomResult<DiscoverResponse>) in
                switch result {
                case .success(let genres):
                    completion(.success(genres))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
