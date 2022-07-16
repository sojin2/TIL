//
//  Menu.swift
//  RxSwift+MVVM
//
//  Created by sojinKim on 2022/07/11.
//  Copyright © 2022 iamchiwon. All rights reserved.
//

import Foundation

// ViewModel
struct Menu {
    var id: Int
    var name: String
    var price: Int
    var count: Int
}

extension Menu {
    static func fromMenuItem(id: Int, item: MenuItem) -> Menu {
        return Menu(id: id, name: item.name, price: item.price, count: 0)
    }
}
