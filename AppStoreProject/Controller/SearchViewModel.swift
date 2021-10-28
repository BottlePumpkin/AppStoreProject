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

    var disposeBag = DisposeBag()
    
    
    var searchResults : [SearchResultModel] = []
    var loading = false
    
    let usecase: AppStoreResultUseCase
    
    
    var numberOfSearhList : Int {
        return searchResults.count
    }
    

    
    
    init(usecase: AppStoreResultUseCase) {
        self.usecase = usecase
    }
    

    
    func searchAppstoreSearch(searchKeyword : String,completion: @escaping() -> ()) {
        
        usecase.call(searchKeyword: searchKeyword) { [unowned self] results  in
            self.searchResults = results.results ?? []
            completion()
        }
        
    }
    
    func searchInfo(at tag: Int) -> SearchResultModel {
        return searchResults[tag]
    }
    
    
    func numberOfSearchScreenList(at tag: Int) -> Int {
        return searchResults[tag].screenshotUrls?.count ?? 0
    }
    
    func searchImage(at tag: Int, at index : Int) -> String {
        
        return searchResults[tag].screenshotUrls?[index] ?? ""
    }
    
    
    
    
    
}
