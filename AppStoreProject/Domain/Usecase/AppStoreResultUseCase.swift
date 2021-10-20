//
//  ResultUseCase.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/05.
//

import Foundation
import RxSwift

final class AppStoreResultUseCase {
    
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func fetchSearchResult(keyword: String) -> Observable<AppStoreSearchResultModel> {
        
        return network.fetchSearchResult(keyword: keyword)
    }
    
    
    
}
