//
//  Resource.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/10/27.
//
//


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
