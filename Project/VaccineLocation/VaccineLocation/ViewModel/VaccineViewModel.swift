//
//  VaccineViewModel.swift
//  VaccineLocation
//
//  Created by sojinKim on 2022/06/23.
//

import Foundation
import RxSwift
import Moya

class VaccineViewModel {
    let diposeBag = DisposeBag()
    var centerListObs = BehaviorSubject<[CenterVO.CenterDetailVO]>(value: [])

    func requestPointSaveList(page: Int?
                              ,_ completion: @escaping ([CenterVO.CenterDetailVO])->Void
                              ,_ failed:(()->Void)? = nil ) {
        let provider = MoyaProvider<Center>()
        provider.request(.centerList) { (result) in
            switch result {
            case let .success(response):
                print(response)
                do {
                    let res = try response.map(CenterVO.self)
                    let list = res.data
                    
                    self.centerListObs.onNext(list)
                    
                    
                    
                } catch {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}
