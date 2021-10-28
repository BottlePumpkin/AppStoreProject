//
//  API.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/10/27.
//

import Foundation

class NetworkService {
    
    enum APIError: LocalizedError {
        case urlNotSupport
        case noData
        
        var errorDescription: String? {
            switch self {
            case .urlNotSupport:
                return "URL Not Supported"
            case .noData:
                return "Has No Data"
            }
        }
        
    }
    
    
    static let shared: NetworkService = NetworkService()
    
    
    private lazy var defaultSession = URLSession(configuration: .default)
    
    private init() {
        
    }
    
    
    func get1<T>(url : String,method: HttpMethods,completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        
        guard let url = URL(string: url
        ) else {
            completion(.failure(.urlNotSupport))
            return }
        
        let resource = Resource<T>(url: url)
        defaultSession.load(resource) { data, _ in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
   }
    
    // query string 있을때
    
    func get2<T>(url : String,method: HttpMethods,parameter : [String : String],completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        
        
        let resource = Resource<T>(url: url,parameters: parameter)
        defaultSession.load(resource) { data, _ in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
   }
    
    func post<T>(url : String,method: HttpMethods,parameter : [String : String],completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        
        guard let url = URL(string: url
        ) else {
            completion(.failure(.urlNotSupport))
            return }
        
        
        let resource = Resource<T>(url: url,method: .post(parameter))
        
        defaultSession.load(resource) { data, _ in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
   }
    
    
    
    
}






