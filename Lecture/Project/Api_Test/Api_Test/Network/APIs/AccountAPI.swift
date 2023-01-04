//
//  AccountAPI.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/04.
//

import Foundation
import Alamofire

struct AccountAPI {
    class API {
        static let session: Session = {
            let configuration = URLSessionConfiguration.af.default
            configuration.timeoutIntervalForRequest = 10
            configuration.timeoutIntervalForResource = 10
            let apiLogger = APIEventLogger()
            return Session(configuration: configuration, eventMonitors: [apiLogger])
        }()
        
    static func getPhone(request: PhoneRequest, completion: @escaping (_ succeed:, _ failed: Error?) -> Void) {
        AF.request(LoginTarget.login(request))
            .responseDecodable { (response: AFDataResponse<LoginResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}
