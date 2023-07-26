//
//  UserCompanyVO.swift
//  Api_Test
//
//  Created by 김소진 on 2023/06/07.
//

import Foundation

// MARK: - Welcome
struct CompanyVO: Codable {
    let code: Int?
    let message: String?
    let result: [CompanyResult]?
}

// MARK: - Result
struct CompanyResult: Codable {
    let id: Int?
    let phone: String?
    let country: String?
    let username: String?
    let latest: String?
    let photos: [CompanyPhoto]?
    let position: String?
    let positionLevel: Int?
    let company: Company?
}

// MARK: - Company
struct Company: Codable {
    let id: Int?
    let name: String?
    let representative: String?
    let telephone, businessNumber, fileKeys, companyState: String?
    let address, fax: String?
    let created: String?
}

struct CompanyPhoto: Codable {
    let url: String?
}

