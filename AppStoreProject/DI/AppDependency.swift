//
//  AppDependency.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/04.
//

import Foundation


struct AppDependency {
    let mainCoordinator: MainCoordiantor

    
}

extension AppDependency {
    
    static func resolve() -> AppDependency {
        let searchRepository = Network()
        let useCase = ResultUsecase(searchRepository: searchRepository)
        let viewModel = SearchViewModel(usecase: useCase)
        let searchController = SearchViewController(searchViewModel: viewModel)
        
        
        let mainCoordinator: MainCoordiantor = .init(rootViewController: searchController)
        
        return .init(mainCoordinator: mainCoordinator)
    }
    
}
