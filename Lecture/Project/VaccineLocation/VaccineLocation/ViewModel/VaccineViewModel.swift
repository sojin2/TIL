//
//  VaccineViewModel.swift
//  VaccineLocation
//
//  Created by sojinKim on 2022/06/23.
//

import Foundation
import Moya

class VaccineViewModel {

    func requestPointSaveList() {
        let provider = MoyaProvider<Center>()
        print("????",provider)
        provider.request(.centerList) { (result) in
            print("????",result)
            switch result {
            case let .success(response):
                print("????",response)
                let result = try? response.map(CenterDetailVO.self)
                print("??",result)
            case let .failure(error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}
