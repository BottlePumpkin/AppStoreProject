//
//  URLSession+Extension.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/10/27.
//

import Foundation


extension URLSession {
    func load<T>(_ resource: Resource<T>,completion: @escaping(T?, Bool) -> Void) {
        dataTask(with: resource.urlRequest) { data, response, _ in
            if let response = response as? HTTPURLResponse,                (200..<300).contains(response.statusCode) {
                    
                    completion(data.flatMap(resource.parse), true)
                
            } else {
                completion(nil,false)
            }
        }.resume()
        
        
    }
    
    
}
