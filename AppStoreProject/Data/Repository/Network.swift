//
//  SearchRepository.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/05.
//


import RxSwift
import UIKit
import RxCocoa

final class Network {
    
    
    private let urlSession = URLSession.shared
    let decoder = JSONDecoder()
    
    func fetchSearchResult(keyword: String) -> Observable<AppStoreSearchResultModel> {
        
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")
       urlComponents?.query = "term=\(keyword)&country=kr&entity=software"
           
       let url = urlComponents?.url ?? URL(fileURLWithPath: "")
        
        return urlSession.rx.data(request: URLRequest(url: url)).map {
            data -> AppStoreSearchResultModel in
            return try self.decoder.decode(AppStoreSearchResultModel.self, from: data)
        }
    }

}


//언제 프로토콜을 사용하면 적절한지? 언제 싱글톤을 사용하면 적절하고 좋은지에 대한 고민..
protocol fetchNetworkProtocol {
    func fetchAppStoreSearchResult(searchKeyword: String)
    
}

final class FetchNetwork : fetchNetworkProtocol {
    func fetchAppStoreSearchResult(searchKeyword : String) {
        
        CommonNetwork.shared.fetchModel(url: URLSource.shared.itunesSearchUrl, searchKeyword: searchKeyword) { (result: Result<AppStoreSearchResultModel,APIError>) in
            switch result {
            case .success(let success):
                debugPrint(success)
            case .failure(let failure):
                debugPrint(failure)
            }
        }
        
    }
}
