//
//  BooksViewModel.swift
//  BookSearch
//
//  Created by 김소진 on 2022/11/12.
//

import Foundation
import Alamofire
import RxSwift

class BooksViewModel: ObservableObject {
    
    @Published var booksObs = [Book]()

 
    func getRequest(url: String) -> Observable<Result<Book, Error>> {

        return Observable.create { booksObs -> Disposable in
            AF.request(url, method: .get, encoding: JSONEncoding.default)
                .responseDecodable(of: Book.self) { response in
                    switch response.result {
                    case .success(let data):
                        print("book 성공 \(data)")
                        booksObs.onNext(.success(data))
                    case .failure(let error):
                        print("book 실패")
                        booksObs.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
    
    
    
    
}
