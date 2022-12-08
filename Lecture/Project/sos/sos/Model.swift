//
//  Model.swift
//  sos
//
//  Created by 김소진 on 2022/11/13.
//

import Foundation
import ObjectMapper

// MARK: - Welcome
struct Welcome: Codable {
    let totalItems: Int
//    let items: [Item]
}

// MARK: - Item
//struct Item: Codable {
//    let volumeInfo: VolumeInfo
//}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let subtitle: String?
    let authors: [String]?
    let categories: [String]?
    let imageLinks: ImageLinks
    let language: Language
    let publisher: String?

    enum CodingKeys: String, CodingKey {
        case title, subtitle, authors
        case categories, imageLinks, language, publisher
    }
}

class Book: Mappable {
    var title: String?
    var subtitle: String?
    var description: String?

    required init?(map: Map){

    }

    func mapping(map: Map) {
      title <- map["title"]
      subtitle <- map["subtitle"]
      description <- map["description"]
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

enum Language: String, Codable {
    case en = "en"
}


