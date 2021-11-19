//
//  Resource.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/10/27.
//
//
//별도의 관리 포인트 없이 바로 request를 실행하게 되면, 개별 API 별로 return type을 지정해야하는 문제가 생깁니다.
//그런 문제를 해결하기 위해서 Encodable, Decodable type을 Generic하게 입력 받는 resource라는 관리포인트를 생성하는 것이 좋습니다.
//각 request type에 따른 URLRequest Setting을 하도록 합니다.


import Foundation


struct Resource<T> {
    var urlRequest: URLRequest
    let parse: (Data) -> T?
}


extension Resource where T: Decodable {
    
    
 
    init(url: String, parameters _parameters : [String : String]) {
        var component = URLComponents(string: url)
        var parameters = [URLQueryItem]()
        
        for (name,value) in _parameters {
            if name.isEmpty { continue }
            parameters.append(URLQueryItem(name: name, value: value))
        }
        
        if !parameters.isEmpty {
            component?.queryItems = parameters
        }
        
        if let component = component?.url {
            self.urlRequest = URLRequest(url: component)
        } else {
            self.urlRequest = URLRequest(url: URL(string: url)!)
        }
        
        self.parse = { data in
            try? JSONDecoder().decode(T.self, from: data)
        }
        
        
    }
    
    //3
    
    init<U: Codable>(url : URL, method: HttpMethod,parameter : [String : U]) {
        self.urlRequest = URLRequest(url: url)
        self.urlRequest.httpMethod = method.method
        
        switch method {
            
        case .post,.put,.patch,.delete:
            self.urlRequest.httpBody = try? JSONEncoder().encode(parameter)
            self.urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            self.urlRequest.addValue("application/json", forHTTPHeaderField: "Accpet")
        default: break
        }
        
        self.parse = { data in
            try? JSONDecoder().decode(T.self, from: data)
        }
    }
}
