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
