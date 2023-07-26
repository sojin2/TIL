//
//  AdviceAPI.swift
//  MoyaAPI
//
//  Created by HelloDigital_iOS_Dev on 2022/06/23.
//

import UIKit
import Moya

enum AdviceAPI {
    case randomAdvice
}

extension AdviceAPI: TargetType {

    
    var baseURL: URL {
        return URL(string: "https://api.adviceslip.com")!
    }
    
    var path: String {
        switch self {
        case .randomAdvice:
            return "/advice"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .randomAdvice:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .randomAdvice:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

struct Advice: Decodable {
    var slip: Slip

    struct Slip: Decodable {
        var id: Int
        var advice: String
    }
}
