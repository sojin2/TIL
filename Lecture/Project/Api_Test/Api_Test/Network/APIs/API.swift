//
//  API.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/06.
//

import Foundation
import Alamofire

class API {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        return Session(configuration: configuration, eventMonitors: [apiLogger])
    }()
}
