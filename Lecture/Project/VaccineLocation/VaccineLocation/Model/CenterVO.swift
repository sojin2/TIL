//
//  CenterVO.swift
//  VaccineLocation
//
//  Created by sojinKim on 2022/06/23.
//

import Foundation

// 필요한 데이터
// 센터명(centerName), 건물명(facilityName), 주소(address), 업데이트시간(updateAt), 전화번호(phoneNumber)

// {
//"currentCount": 10,
//"data": [
//"matchCount": 284,
//"page": 1,
//"perPage": 10,
//"totalCount": 284
    
struct CenterVO: Codable {
    var page: Int?
    var perPage: Int?
    var totalCount: Int?
    var currentCount: Int?
    var matchCount: Int?
    var data: CenterDetailVO
}

struct CenterDetailVO: Codable{
    var address: String?
    var centerName: String?
    var facilityName: String?
    var createdAt: String?
    var phoneNumber: String?
}

