//
//  HttpMethod.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/10/27.
//

import Foundation
import SwiftUI


enum HttpMethod<Body> {
    case get
    case post(Body)
    case put(Body)
    case patch(Body)
    case delete(Body)
}


extension HttpMethod {
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}
