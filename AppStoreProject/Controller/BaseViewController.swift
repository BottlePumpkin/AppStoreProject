//
//  BaseViewController.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/04.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    func configureUI() {
       
    }

}
