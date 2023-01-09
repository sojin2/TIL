//
//  AccountRequest.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/04.
//

import Foundation
 
struct PhoneModel: Codable {
    let code: Int
    let message: String
    let result: Result
}

struct Result: Codable {
    let id: Int
    let username, phone, country: String
    let photos: [Photo]
    let latest, created: String
}

struct Photo: Codable {
    let id, bucket: String
    let url, middleUrl, smallUrl, largeUrl: String
    let prefix: String
}
