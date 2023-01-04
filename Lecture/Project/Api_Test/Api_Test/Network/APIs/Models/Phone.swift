//
//  Phone.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/04.
//

import Foundation

// MARK: - Welcome
struct Phone: Codable {
    let code: Int
    let message: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let username, phone, country: String
    let photos: [Photo]
    let latest, created: String
}

// MARK: - Photo
struct Photo: Codable {
    let id, bucket: String
    let url, middleURL, smallURL, largeURL: String
    let photoPrefix: String

    enum CodingKeys: String, CodingKey {
        case id, bucket, url
        case middleURL = "middleUrl"
        case smallURL = "smallUrl"
        case largeURL = "largeUrl"
        case photoPrefix = "prefix"
    }
}
