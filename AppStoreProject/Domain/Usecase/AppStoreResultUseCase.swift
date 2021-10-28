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
    private let api: API
    
    init(network: Network, api: API) {
        self.network = network
        self.api = api
    }
    
    func fetchSearchResult(keyword: String) -> Observable<AppStoreSearchResultModel> {
        
        return network.fetchSearchResult(keyword: keyword)
    }
    
    
    
    func call(searchKeyword: String,completion: @escaping(AppStoreSearchResultModel) -> Void) {
        return api.fetchAppStoreSearch(searchKeyword: searchKeyword) { result in
            completion(result)
        }
        
    }
    
    
    
}
