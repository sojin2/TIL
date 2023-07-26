//
//  UsersVO.swift
//  Api_Test
//
//  Created by 김소진 on 2023/06/07.
//

import Foundation

// MARK: - Welcome
struct UsersVO: Codable {
    let code: Int
    let message: String
    let result: [UsersResult]?
}

// MARK: - Result
struct UsersResult: Codable {
    let key: UsersKey
    let operatorID: Int
    let assigned, created: String?
    let companyUser: CompanyUsers?
    var checkInAttendance, checkOutAttendance: [CheckAttendance]?

    enum CodingKeys: String, CodingKey {
        case key
        case operatorID = "operatorId"
        case assigned, created, companyUser, checkInAttendance, checkOutAttendance
    }
}

// MARK: - UsersKey
struct UsersKey: Codable {
    let id, userID: Int

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
    }
}


// MARK: - CompanyUser
struct CompanyUsers: Codable {
    let key: CompanyUserKey
    let name, position, phone: String
    let state: String?
    let userState: String?
    let user: User?
    let sites: String?
    let created: String?
    let positionLevel: Int?
}

// MARK: - CompanyUserKey
struct CompanyUserKey: Codable {
    let id, companyID: Int

    enum CodingKeys: String, CodingKey {
        case id
        case companyID = "companyId"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let phone: String
    let country: String
    let username: String
    let latest: String?
    let photos: [UsersPhoto]
    let position, positionLevel, company: String?
}

struct UsersPhoto: Codable {
    let url: String
}

// MARK: - CheckAttendance
struct CheckAttendance: Codable {
    let id: Int
    let latitude, longitude: Double
    let userID, siteID: Int
    let confirmed: String?
    let created: String
    let checkIn, checkOut: String?
    let photo: CheckPhoto
    let isConfirmed, isDeleted: Bool

    enum CodingKeys: String, CodingKey {
        case id, latitude, longitude
        case userID = "userId"
        case siteID = "siteId"
        case confirmed, created, checkIn, checkOut, photo
        case isConfirmed, isDeleted
    }
}

// MARK: - Photo
struct CheckPhoto: Codable {
    let url: String
}


