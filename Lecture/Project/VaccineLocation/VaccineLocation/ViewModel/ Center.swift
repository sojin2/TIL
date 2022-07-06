//
//  Location.swift
//  VaccineLocation
//
//  Created by HelloDigital_iOS_Dev on 2022/06/24.
//

import Foundation
import Moya

enum Center {
    case centerList
}

extension Center: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.odcloud.kr/api/15077586/v1")!
    }
    
    var path: String {
        switch self {
        case .centerList:
            return "/centers"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .centerList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .centerList:
            let serviceKey:String = "PfLkiRLzxkcn5c4Hs6esI53VS2WPQ9rZqVFiqFkZadLz2xejI5WrnvGiaFLXsxrogUMjylodC34OSNXJnEtaGw=="
            
            
            var params: [String: Any] = ["serviceKey" : serviceKey]
            params["serviceKey"] = serviceKey
            params["page"] = 1
            params["perPage"] = 10
            
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }

}


