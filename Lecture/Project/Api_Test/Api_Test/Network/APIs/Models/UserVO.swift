//
//  UserVO.swift
//  Api_Test
//
//  Created by 김소진 on 2023/06/07.
//

import Foundation

// MARK: - Welcome
struct UserVO: Codable {
    let code: Int
    let message: String
    let result: UserResult
}

// MARK: - Result
struct UserResult: Codable {
    let id: Int
    let phone, username: String
    let photos: [UserPhoto]?
    let position: String?
    let positionLevel: Int?
    let company: String?
}

// MARK: - Photo
struct UserPhoto: Codable {
    let url: String
}
