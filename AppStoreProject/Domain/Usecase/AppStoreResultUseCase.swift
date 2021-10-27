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
    private let fetchNetwork: FetchNetwork
    
    init(network: Network, fetchNetwork: FetchNetwork) {
        self.network = network
        self.fetchNetwork = fetchNetwork
    }
    
    func fetchSearchResult(keyword: String) -> Observable<AppStoreSearchResultModel> {
        
        return network.fetchSearchResult(keyword: keyword)
    }
    
    func fetchAppStoreSearchResult(searchKeyword : String) {
        
        return fetchNetwork.fetchAppStoreSearchResult(searchKeyword: searchKeyword)
    }
    
    func fetchAppStoreSearch(searchKeyword: String) {
        return fetchNetwork.fetchAppStoreSearch(searchKeyword: searchKeyword)
    }

    
    
}
