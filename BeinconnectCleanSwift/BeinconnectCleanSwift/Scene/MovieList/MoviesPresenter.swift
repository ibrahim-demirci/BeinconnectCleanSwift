//
//  MoviesPresenter.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

class MoviesPresenter: MoviesPresenterProtocol {
    
    // MARK: - Properties
    weak var viewController: MoviesViewControllerProtocol?
    
    func presentGenresData(_ genres: [Genre]) {
        let dataSource = MoviesDataSource(genres)
        viewController?.displayGenres(moviesDataSource: dataSource)
    }
    
    func presentMoviesData(_ movies: [Movie], indexPath: IndexPath) {
        viewController?.updateMoviesAtSection(movies, indexPath: indexPath)
    }
}
