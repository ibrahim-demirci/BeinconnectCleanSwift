//
//  MoviesConfigurator.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

struct MoviesConfigurator {
    
    static func createScene() -> MoviesViewController {
        let viewController = MoviesViewController()
        let presenter = MoviesPresenter()
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        let worker = MoviesWorker()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        viewController.router = router
        router.viewController = viewController
        
        return viewController
    }
}
