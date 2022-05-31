//
//  CreditCard.swift
//  CreditCardList
//
//  Created by HelloDigital_iOS_Dev on 2022/05/31.
//

import Foundation

struct CreditCard: Codable {
    let id: Int
    let rank: String
    let name: String
    let cardImageURL: String
    let promotionDetail: PromotionDetail
    let isSelected: Bool
}

struct PromotionDetail: Codable {
    let companyName: String
    let period: String
    let amount: Int
    let condition: String
    let benefitCondition: String
    let benefitDetail: String
    let benefitDate: String
}
