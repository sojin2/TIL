//
//  Profile.swift
//  WorkingwithUIControls
//
//  Created by 김소진 on 2022/11/30.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "☀️"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
