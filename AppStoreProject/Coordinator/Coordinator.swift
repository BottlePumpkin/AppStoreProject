//
//  Coordinator.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/04.
//

import UIKit

protocol Coordinator {
    var navigationController : UINavigationController? { get set }
    
    func start()
    
}


