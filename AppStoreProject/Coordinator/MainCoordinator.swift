//
//  MainCoordinator.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/04.
//

import UIKit

class MainCoordiantor: Coordinator {
    var navigationController: UINavigationController?
    let rootViewController: SearchViewController
    
    
    init(rootViewController: SearchViewController) {
        self.rootViewController = rootViewController
    }
    
    
    func start() {
        navigationController?.setViewControllers([rootViewController], animated: false)
        navigationController?.setViewControllers([rootViewController],animated:false)
    }
    
}
