//
//  MooviesInteractor.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

class MoviesInteractor: MoviesInteractorProtocol {

    var presenter: MoviesPresenterProtocol?
    var worker: MoviesWorker?
    
    var cachedMovies: [Int: [Movie]] = [:]

    
    func getGenres() {
        worker?.getGenres(completion: { [weak self] result in
            switch result {
            case .success(let response):
                if let genres = response?.genres {
                    self?.presenter?.presentGenresData(genres)
                }
              
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func getMoviesAtSection(id: Int, indexPath: IndexPath) {
        if cachedMovies.keys.contains(indexPath.section) {
            self.presenter?.presentMoviesData(cachedMovies[indexPath.section]!, indexPath: indexPath)
            return
        }
        
        worker?.getMoviesAtSection(id: id, completion: { [weak self] result in
            switch result {
            case .success(let response):
                if let movies = response?.results {
                    self?.cachedMovies[indexPath.section] = movies
                    self?.presenter?.presentMoviesData(movies, indexPath: indexPath)
                }
              
            case .failure(let error):
                print(error)
            }
        })
    }
}
