//
//  AccountTarget.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/04.
//

import Foundation
import Alamofire


enum APIBase {
    case getPhone
    case putPassword
}

extension APIBase: TargetType {
    
    
    var baseURL: String {
        return "https://www.odigo.ai"
    }
    
    var header: HTTPHeaders {
        ["Accept": "application/json",
         "Content-Type": "application/json",
         "Authorization": "bearer \(Saved.token)"
        ]
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPhone:
            return .get
        case .putPassword:
            return .put
        }
    }
    
    var path: String {
        switch self {
        case .getPhone:
            return "/api/accounts/phone/01082592164"
        case .putPassword:
            return "/api/users/password"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .getPhone: return nil
        case .putPassword:
            return .query(["type": "ios", "code": Saved.push])
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getPhone:
            return URLEncoding.self as! ParameterEncoding
        case .putPassword:
            return JSONEncoding.default
        }
    }

    
}

