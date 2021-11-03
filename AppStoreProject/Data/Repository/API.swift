//
//  API.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/10/27.
//

import Foundation


final class API {
    
    
    func fetchAppStoreSearch(searchKeyword : String,completion: @escaping(AppStoreSearchResultModel) -> Void) {
        let parameter = [
            "term" : searchKeyword,
            "country" : "kr",
            "entity" : "software"
        ]
    
        
        NetworkService.shared.get2(url: EndPoint.itunesSearchUrl, method: .get, parameter: parameter) {  (result: Result<AppStoreSearchResultModel,NetworkService.APIError>) in
            switch result {
            case .success(let success):
                debugPrint(success)
                completion(success)
            case .failure(let failure):
                debugPrint(failure)
            }
        }
        
    }
    
    
    func fetchAppStoreSearchResult(searchKeyword : String) {
        
        
        let parameter = [
            "term" : searchKeyword,
            "country" : "kr",
            "entity" : "software"
        ]
        
        CommonNetwork.shared.fetchModel(url: EndPoint.itunesSearchUrl, method: .get, parameter: parameter) { (result: Result<AppStoreSearchResultModel,APIError>) in
            switch result {
            case .success(let success):
                debugPrint(success)
            case .failure(let failure):
                debugPrint(failure)
            }
        }
        
    }
}
