//
//  CommonNetwork.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/10/21.
//

import Foundation
import Alamofire


enum HttpMethods {
    case get
    case post
    case put
    case patch
    case delete
    
}

extension HttpMethods {
    var method : String {
        switch self {
        
        case .get:
           return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATHCH"
        case .delete:
            return "DELETE"
        }
    }
    
    
}


protocol CommonNetworkProtocol {
    func fetchModel<T:Decodable>(url : String,method : HttpMethods,parameter : [String : String],completion : @escaping(Result<T,APIError>) -> Void)
}

public enum Result<Success, Failure> where Failure : Error {
    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Failure` value.
    case failure(Failure)
}

enum APIError: Error {
    case data
    case decodingJSON
}



final class CommonNetwork : CommonNetworkProtocol {
    
    static let shared = CommonNetwork()
    
    private let urlSession = URLSession.shared
    let decoder = JSONDecoder()
    
    
    func parameterToQueryString(parameters : [String : String]) -> String {
        
        var queryString = "?"

       parameters.forEach {
           queryString = queryString +  "\($0.key)=\($0.value)&"
       }
        
        queryString.remove(at: queryString.index(before: queryString.endIndex))
        
        return queryString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
    
    func fetchModel<T>(url : String,method: HttpMethods,parameter : [String : String],completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        
        guard let url = URL(string: url + parameterToQueryString(parameters: parameter)
        ) else { return }

        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.method
        
       URLSession.shared.dataTask(with: urlRequest) { data, response, error in

           guard let data = data else {
               return completion(.failure(.data))
           }

           guard let model = try? JSONDecoder().decode(T.self, from: data) else {
               return completion(.failure(.decodingJSON))
           }

           completion(.success(model))
           
       }.resume()
   }

    

    
}
 
    




