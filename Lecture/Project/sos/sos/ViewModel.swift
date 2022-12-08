//
//  ViewModel.swift
//  sos
//
//  Created by 김소진 on 2022/11/13.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class ViewModel: ObservableObject {
 //   @Published var booksObs = [Welcome]()
//    @Published var booksInfoObs = [VolumeInfo]()
//    @Published var imageObs = [ImageLinks]()

    @Published var BookObs2 = [Book]()

    func getBooks(url: String) -> Observable <Book> {

        return Observable.create { _ in
            AF.request(url,
                       method: .get,
                       encoding: URLEncoding.default)
            .responseJSON { (response) in
                    switch response.result {
                    case .success(let data):
                        print("sdfasdfasdfasdsddd",String(data: data as! Data, encoding: .utf8)!)
                        
                        print("sdfasdfasdfasdsddd",response.result)

                        let books = response.result
                        //print(books.title)

                    case .failure(let error):
                        print("실패 \(response) 으어아아아 왜에")
                    }
                }
            return Disposables.create()
        }
    }


    @Published var BookObs = [Welcome]()
    
       
       func getRequest(url: String) -> Observable<Welcome> {

           return Observable.create { BookObs -> Disposable in
               AF.request(url,
                          method: .get,
                          encoding: JSONEncoding.default)
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
