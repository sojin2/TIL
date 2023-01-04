//
//  AccountTarget.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/04.
//

import Foundation
import Alamofire


enum AccountTarget {
    case getPhone(PhoneRequest)
}

extension AccountTarget: TargetType {
    
    var baseURL: String {
        return "https://www.odigo.ai"
    }
    
    var header: HTTPHeaders {
        ["Accept": "application/json",
         "Content-Type": "application/json"
        ]
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPhone:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getPhone:
            return "/v2/api/accounts/phone/01082592164"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .getPhone: return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getPhone:
            return URLEncoding
        }
    }

    
}

