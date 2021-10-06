//
//  SearchRepository.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/05.
//


import RxSwift

protocol SearchRepository {
    func fetchSearchResult(keyword: String) -> Observable<ResultResponse>
}
