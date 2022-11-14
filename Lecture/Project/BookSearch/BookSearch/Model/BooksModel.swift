//
//  BooksModel.swift
//  BookSearch
//
//  Created by 김소진 on 2022/11/11.
//

import Foundation

// 책의 커버 이미지, 제목, 저자, 출판일
// 검색된 책의 총 수량
// 앱에서 직접 구현, 책의 주요 정보라고 판단되는 것들만 표시

// MARK: - Welcome
struct Welcome: Codable {
    let totalItems: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let volumeInfo: VolumeInfo
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]?
    let categories: [String]?
    let imageLinks: ImageLinks
    let language: Language
    let publisher: String?

    enum CodingKeys: String, CodingKey {
        case title, authors
        case categories, imageLinks, language, publisher
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

enum Language: String, Codable {
    case en = "en"
}
