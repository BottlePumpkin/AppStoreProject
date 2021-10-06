//
//  SearchRepositoryImpl.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/05.
//

import RxSwift
import RxCocoa
import Foundation


class SearchRepositoryImpl: SearchRepository {

    
    private let urlSession = URLSession.shared
    let decoder = JSONDecoder()
    
    func fetchSearchResult(keyword: String) -> Observable<ResultResponse> {
        
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")
       urlComponents?.query = "term=\(keyword)&country=kr&entity=software"
           
       let url = urlComponents?.url!
        
        
        return urlSession.rx.data(request: URLRequest(url: url!)).map {
            data -> ResultResponse in
            return try self.decoder.decode(ResultResponse.self, from: data)
        }
    }
    
    
    
    
}


extension SearchRepositoryImpl {
    static let shared: SearchRepository = SearchRepositoryImpl()
}
