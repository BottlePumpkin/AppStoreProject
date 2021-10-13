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
    var disposeBag = DisposeBag()
    
    
    let usecase: ResultUsecase
    
    init(usecase: ResultUsecase) {
        self.usecase = usecase
    }
    
    
    func viewDidLoad() {
        loading.onNext(true)
        usecase.fetchSearchResult(keyword: "카카").asObservable().subscribe(onNext: { results in
            self.loading.onNext(false)
            self.results.onNext(results)
        }).disposed(by: disposeBag)
    }
    
    
    
    
}
