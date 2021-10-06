//
//  BaseView.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/04.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
       
    }

}
