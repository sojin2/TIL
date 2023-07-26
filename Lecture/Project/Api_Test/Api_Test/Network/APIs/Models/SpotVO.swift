//
//  SpotVO.swift
//  Api_Test
//
//  Created by 김소진 on 2023/06/07.
//

import Foundation


// MARK: - Welcome
struct SpotVO: Codable {
    let code: Int?
    let message: String?
    let result: [SpotResult]?
}

// MARK: - Result
struct SpotResult: Codable {
    let id: Int?
    let name, address: String?
    let latitude, longitude: Double?
    let memo: String?
    let companyID, userID: Int?
    let attendanceAvailableDistance: Int?
    let siteType: String?
    let closed: String?
    let activated: String
    let deleted: String?
    let created: String?
    let siteTypeDisplayName: String?
    var photos: [SpotPhoto]?

    enum CodingKeys: String, CodingKey {
        case id, name, address, latitude, longitude, memo
        case companyID = "companyId"
        case userID = "userId"
        case attendanceAvailableDistance, siteType, closed, activated, deleted, created, siteTypeDisplayName, photos
    }
}

// MARK: - Photo
struct SpotPhoto: Codable {
    let url: String?
}

