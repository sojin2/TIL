//
//  ViewModel.swift
//  sos
//
//  Created by 김소진 on 2022/11/13.
//

import Foundation
import Alamofire
import RxSwift

class ViewModel: ObservableObject {
 //   @Published var booksObs = [Welcome]()
//    @Published var booksInfoObs = [VolumeInfo]()
//    @Published var imageObs = [ImageLinks]()

    
    @Published var BookObs = [Book]()

       
       func getRequest(url: String) -> Observable<Book> {

           return Observable.create { BookObs -> Disposable in
               AF.request(url, method: .get, encoding: JSONEncoding.default)
                   .responseDecodable(of: Book.self) { response in
                       switch response.result {
                       case .success(let data):
                           print("info 성공 \(data)")
                           BookObs.onNext(data)
                       case .failure(let error):
                           print("info 실패 \(response) 으어아아아 왜에")
                           BookObs.onError(error)
                       }
                   }
               return Disposables.create()
           }
       }
     
    
}
