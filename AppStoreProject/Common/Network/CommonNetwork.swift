//
//  CommonNetwork.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/10/21.
//

import Foundation
import Alamofire


protocol CommonNetworkProtocol {
    func fetchModel<T:Decodable>(url : String,searchKeyword: String,completion : @escaping(Result<T,APIError>) -> Void)
    
    //왜 이렇게 하면 안될까?
    //get 일떄는 parameter => encoding queryString ,
    //post 일때는 parameter => encoding json.default로 이건 너무 어렵나?
    
//    func fetchModel<T:Decodable,Parameters: Encodable>(url: String,searchKeyword: String,parameters: Parameters,completion : @escaping(Result<T,APIError>) -> Void)
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
    
    func fetchModel<T>(url : String,searchKeyword: String,completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        var urlComponents = URLComponents(string: url)
        urlComponents?.query = "term=\(searchKeyword)&country=kr&entity=software"

        let url = urlComponents?.url ?? URL(fileURLWithPath: "")
       
       URLSession.shared.dataTask(with: url) { data, response, error in

           guard let data = data else {
               return completion(.failure(.data))
           }

           guard let model = try? JSONDecoder().decode(T.self, from: data) else {
               return completion(.failure(.decodingJSON))
           }

           completion(.success(model))
           
       }.resume()
   }

    
//    AF.request(<#T##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoder: <#T##ParameterEncoder#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##RequestModifier?#>)
    
}
 
    




