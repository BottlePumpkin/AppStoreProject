//
//  AppDependency.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/04.
//

import Foundation


struct AppDependency {
    let mainCoordinator: MainCoordiantor
    let searchViewModel: SearchViewModel
    let resultUsecase: ResultUsecase
    
}

extension AppDependency {
    
    static func resolve() -> AppDependency {
        let resultUseCase: ResultUsecase = .init(searchRepository: SearchRepositoryImpl.shared)
        let searchViewModel: SearchViewModel = .init(usecase: resultUseCase)
        
        let mainCoordinator: MainCoordiantor = .init(searchViewModel: searchViewModel)
        
        return .init(mainCoordinator: mainCoordinator, searchViewModel: searchViewModel, resultUsecase: resultUseCase)
    }
    
}
