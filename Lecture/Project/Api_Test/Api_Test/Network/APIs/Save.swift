//
//  Save.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/04.
//

import Foundation

public class Saved {
    
    var _token: String = ""
    static var token: String {
        set { UserDefaults.standard.set(newValue, forKey: "TOKEN")}
        get { return UserDefaults.standard.string(forKey: "TOKEN") ?? "" }
    }
}
