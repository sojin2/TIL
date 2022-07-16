//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by sojinKim on 2022/07/12.
//  Copyright © 2022 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

class MenuListViewModel {
    
    // lazy var menuObservable = Observable.just(menus)
    var menuObservable = BehaviorSubject<[Menu]>(value: []) // 메뉴 array가 주어지면 observable이 계속 동작함
    
    lazy var itemsCount = menuObservable.map {
        $0.map { $0.count }.reduce(0, +)
    }
    lazy var totalPrice = menuObservable.map {
        $0.map { $0.price * $0.count }.reduce(0, +)
    }
    
    //var itemsCount: Int = 0
    //var totalPrice: PublishSubject<Int> = PublishSubject()
    
    // Subject : observable 밖에서도 데이터를 컨트롤 가능
    
    
    init() {
        
        _ = APIService.fetchAllMenusRx()
            .map { data -> [MenuItem] in
                
                struct Response: Decodable {
                    let menus: [MenuItem]
                }
                
                let response = try! JSONDecoder().decode(Response.self, from: data)
                return response.menus
            }
            .map { menuItems -> [Menu] in
                var menus: [Menu] = []
                menuItems.enumerated().forEach { index, item in
                    let menu = Menu.fromMenuItem(id: index, item: item)
                    menus.append(menu)
                }
                return menus
            } 
            .take(1)
            .bind(to: menuObservable)
    }
    
    func onOrder() {
        
    }
    
    func clearAllItemSelections() {
        menuObservable
            .map { menus in
                menus.map { m in
                    Menu(id: m.id, name: m.name, price: m.price, count: 0)
                }
            }
            .take(1)
            .subscribe(onNext: {
                self.menuObservable.onNext($0)
            })
    }
    
    
    func changeCount(item: Menu, increase: Int) {
        _ = menuObservable
            .map { menus in
                menus.map { m in
                    if m.id == item.id {
                        return Menu(id: m.id,
                             name: m.name,
                             price: m.price,
                             count: max(m.count + increase, 0))
                    } else {
                        return Menu(id: m.id,
                             name: m.name,
                             price: m.price,
                             count: m.count)
                    }
                }
            }
            .take(1)
            .subscribe(onNext: {
                self.menuObservable.onNext($0)
            })
    }
}
