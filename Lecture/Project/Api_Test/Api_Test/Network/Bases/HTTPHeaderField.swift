//
//  HTTPHeaderField.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/03.
//

import Foundation

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "Application/json"
}
