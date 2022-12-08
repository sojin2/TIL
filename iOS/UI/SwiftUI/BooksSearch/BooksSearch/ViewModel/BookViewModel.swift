//
//  BookViewModel.swift
//  BooksSearch
//
//  Created by 김소진 on 2022/11/29.
//

import Foundation
import Alamofire
import RxSwift


final class BookViewModel: ObservableObject {
    
    @Published var BookObs = [Welcome]
    
    func getRequest(url: String) -> Observable<Welcome> {
        
        return Observable.create { BookObs -> Disposable in
            AF.request(url, method: .get, encoding: JSONEncoding.default)
                .responseDecodable(of: Welcome.self) { response in
                    switch response.result {
                    case .success(let data):
                        print("성공 \(data)")
                        BookObs.onNext(data)
                    case .failure(let error):
                        print("실패 \(response) 으어아아아 왜에")
                        BookObs.onError(error)
                    }
                }
            return Disposables.create()
        }
        
    }
    
}
