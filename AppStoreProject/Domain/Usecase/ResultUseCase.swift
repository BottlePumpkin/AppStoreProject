//
//  ResultUseCase.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/05.
//

import Foundation
import RxSwift

class ResultUsecase {
    
    private let searchRepository: SearchRepository
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }
    
    func fetchSearchResult(keyword: String) -> Observable<ResultResponse> {
        
        return searchRepository.fetchSearchResult(keyword: keyword)
    }
    
    
    
}
