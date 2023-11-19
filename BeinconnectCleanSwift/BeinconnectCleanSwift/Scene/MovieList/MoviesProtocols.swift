//
//  MoviesInterfaces.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import UIKit

protocol MoviesInteractorProtocol {
    func getGenres()
    func getMoviesAtSection(id: Int, indexPath: IndexPath)
}

protocol MoviesPresenterProtocol {
    func presentGenresData(_ genres: [Genre])
    func presentMoviesData(_ movies: [Movie], indexPath: IndexPath)

}

protocol MoviesViewControllerProtocol: AnyObject {
    func displayGenres(moviesDataSource: MoviesDataSource)
    func updateMoviesAtSection(_ movies: [Movie], indexPath: IndexPath)
}

protocol MoviesRoutingProtocol {
    func navigateToMovieDetailsController(_ movie: Movie)
}

protocol MoviesDataSourceDelegate: AnyObject {
    func fetchSectionItems(id: Int, indexPath: IndexPath)
    func movieSelected(movie: Movie)
}
