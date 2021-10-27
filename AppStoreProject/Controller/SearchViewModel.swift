//
//  SearchViewModel.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/06.
//

import Foundation
import RxSwift
import RxCocoa



class SearchViewModel {
    
    var loading: BehaviorSubject<Bool> = .init(value: false)
    var errorMessage: BehaviorSubject<String?> = .init(value: nil)
    var results: BehaviorSubject<AppStoreSearchResultModel> = .init(value: AppStoreSearchResultModel(resultCount: 0, results: []))
    var currentSearchResult: [SearchResultModel] = []
    
    var disposeBag = DisposeBag()
    
    
    let usecase: AppStoreResultUseCase
    
    init(usecase: AppStoreResultUseCase) {
        self.usecase = usecase
    }
    
    
    func searchQueryChanged(query : String) {
        loading.onNext(true)
        usecase.fetchSearchResult(keyword: query).subscribe(onNext: { results in
            self.loading.onNext(false)
            self.results.onNext(results)
            self.currentSearchResult = results.results ?? []
        }).disposed(by: disposeBag)
    }
    
    func searchAppstoreSearch(searchKeyword : String) {
        usecase.fetchAppStoreSearch(searchKeyword: "카카오")
        
        
    }
    
    
    
    
}
