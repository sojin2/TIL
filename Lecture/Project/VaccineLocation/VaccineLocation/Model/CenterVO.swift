//
//  CenterVO.swift
//  VaccineLocation
//
//  Created by sojinKim on 2022/06/23.
//

import Foundation
import ObjectMapper

// 필요한 데이터
// 센터명(centerName), 건물명(facilityName), 주소(address), 업데이트시간(updateAt), 전화번호(phoneNumber)


struct CenterVO: Decodable {
    var data: [CenterDetailVO]
    
    struct CenterDetailVO: Decodable {
        var address: String?
        var centerName: String?
        var facilityName: String?
        var createdAt: String?
        var phoneNumber: String?
    }
}

