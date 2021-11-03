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
        let network = Network()
        let api = API()
        let useCase = AppStoreResultUseCase(network: network, api: api)
        let viewModel = SearchViewModel(usecase: useCase)
        let searchController = SearchViewController(searchViewModel: viewModel)
        
        
        let mainCoordinator: MainCoordiantor = .init(rootViewController: searchController)
        
        return .init(mainCoordinator: mainCoordinator)
    }
    
}
