//
//  SpotDetailVO.swift
//  Api_Test
//
//  Created by 김소진 on 2023/06/27.
// SpotDetailResult

import Foundation


// MARK: - Welcome
// MARK: - Welcome
struct SpotDetailVO: Codable {
    let code: Int
    let message: String
    let result: SpotDetaiResult
}

// MARK: - Result
struct SpotDetaiResult: Codable {
    let site: Site
    let user: User
    let checkInAttendance: [CheckInAttendance]
    let checkOutAttendance: [CheckOutAttendance]
    let notice: [Notice]
}

// MARK: - CheckInAttendance
struct CheckInAttendance: Codable {
    let id: Int
    let latitude, longitude: Double
    let userID, siteID: Int
    let site: Site
    let attendanceType, photoKeys: String
    let confirmed: JSONNull?
    let created, checkIn: String
    let checkOut: JSONNull?
    let photo: Photo
    let updateWorkDescription, updateOperatorID, updated: JSONNull?
    let isConfirmed, isDeleted: Bool

    enum CodingKeys: String, CodingKey {
        case id, work, latitude, longitude
        case userID = "userId"
        case siteID = "siteId"
        case workDescription
        case operatorID = "operatorId"
        case site, attendanceType, photoKeys, confirmed, created, checkIn, checkOut, photo, updateWorkDescription
        case updateOperatorID = "updateOperatorId"
        case updated, isConfirmed, isDeleted
    }
}

struct CheckOutAttendance: Codable {
    let id: Int
    let work: JSONNull?
    let latitude, longitude: Double
    let userID, siteID: Int
    let workDescription, operatorID: JSONNull?
    let site: Site
    let attendanceType, photoKeys: String
    let confirmed: JSONNull?
    let created, checkIn: String
    let checkOut: JSONNull?
    let photo: Photo
    let updateWorkDescription, updateOperatorID, updated: JSONNull?
    let isConfirmed, isDeleted: Bool

    enum CodingKeys: String, CodingKey {
        case id, work, latitude, longitude
        case userID = "userId"
        case siteID = "siteId"
        case workDescription
        case operatorID = "operatorId"
        case site, attendanceType, photoKeys, confirmed, created, checkIn, checkOut, photo, updateWorkDescription
        case updateOperatorID = "updateOperatorId"
        case updated, isConfirmed, isDeleted
    }
}

// MARK: - Photo
struct Photo: Codable {
    let url: String
}

// MARK: - Site
struct Site: Codable {
    let id: Int
    let name, address: String
    let latitude, longitude: Double
    let memo: String
    let companyID, userID: Int
    let attendanceAvailableDistance: Int
    let photoKeys, siteType: String
    let activated: String
    let created, closed, deleted: String
    let siteTypeDisplayName: String
    let photos: [Photo]
    let hasPermit: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, address, latitude, longitude, memo
        case companyID = "companyId"
        case userID = "userId"
        case roadAddress, attendanceAvailableDistance, photoKeys, siteType, closed, activated, deleted, created
        case siteManagerID = "siteManagerId"
        case siteOfficeManagerID = "siteOfficeManagerId"
        case structure, dimension, floorArea, floorAreaRatio, polygon, siteTypeDisplayName, photos, weathers, company, hasPermit
    }
}
// MARK: - Notice
struct Notice: Codable {
    let title, content: String
}

// MARK: - User
struct User: Codable {
    let id: Int
    let phone, country, username, photoKeys: String
    let latest: String
    let photos: [Photo]
    let position: String
    let positionLevel: Int
}

