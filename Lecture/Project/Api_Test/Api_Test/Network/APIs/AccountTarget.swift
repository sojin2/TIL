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

// https://www.odigo.ai/api/accounts/phone/01082592164

extension AccountTarget: TargetType {

    
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
        }
    }
    
    var path: String {
        switch self {
        case .getPhone:
            return "/api/accounts/phone/01082592164"
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
            return JSONEncoding.default
        }
    }

    
}

