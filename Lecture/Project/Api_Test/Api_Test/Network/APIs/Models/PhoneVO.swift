//
//  PhoneVO.swift
//  Api_Test
//
//  Created by 김소진 on 2023/06/27.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

struct PhoneVO: Codable {
    let code: Int
    let message: String
    let result: Result
}

// MARK: - Result
struct PhoneResult: Codable {
    let id: Int
    let phone, country, username, photoKeys: String
    let latest: String
    let photos: [Photo]
}

// MARK: - Photo
struct PhonePhoto: Codable {
    let photoPrefix, id: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case photoPrefix = "prefix"
        case id, url
    }
}
