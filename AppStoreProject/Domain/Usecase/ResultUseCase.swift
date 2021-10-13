//
//  ResultUseCase.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/05.
//

import Foundation
import RxSwift

final class ResultUsecase {
    
    private let searchRepository: Network
    
    init(searchRepository: Network) {
        self.searchRepository = searchRepository
    }
    
    func fetchSearchResult(keyword: String) -> Observable<AppStoreSearchResultModel> {
        
        return searchRepository.fetchSearchResult(keyword: keyword)
    }
    
    
    
}
