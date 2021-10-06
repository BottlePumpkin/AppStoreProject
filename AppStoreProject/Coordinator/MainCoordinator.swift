//
//  MainCoordinator.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/04.
//

import UIKit

class MainCoordiantor: Coordinator {
    var navigationController: UINavigationController?
    let searchViewModel: SearchViewModel
    
    
    init(searchViewModel : SearchViewModel) {
        self.searchViewModel = searchViewModel
    }
    
    func start() {
        let rootViewController = SearchViewController(searchViewModel: searchViewModel)
        navigationController?.setViewControllers([rootViewController], animated: false)
        navigationController?.setViewControllers([rootViewController],animated:false)
    }
    
}
