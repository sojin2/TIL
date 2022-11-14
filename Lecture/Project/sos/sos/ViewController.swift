//
//  ViewController.swift
//  sos
//
//  Created by 김소진 on 2022/11/13.
//

import UIKit
import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadData()
    }


    private func loadData() {
        
        let searchQueryString = "flowers"
        let urlString = "https://www.googleapis.com/books/v1/volumes?key=AIzaSyCZ8OABGtFqbRHmzRUsxMUsB5eCEGbZiic&q=\(searchQueryString)"
        
        
        //   let bookRequest = viewModel.getRequest(url: urlString)
        
        //        bookRequest.subscribe(onNext: { element in
        //            print("실행은 되나22222222222222")
        //            print(element)
        //        }, onCompleted: {
        //            print("onCompleted")
        //        }).disposed(by: disposeBag)
        
        
//        let bookRequest2 = viewModel.getRequest2(url: urlString)
//
//        bookRequest2.subscribe(onNext: { element in
//            print("=============================실행은 되나=====================================")
//            print(element)
//        }, onCompleted: {
//            print("onCompleted")
//        }).disposed(by: disposeBag)
        
        
        ViewModel.getBookAPI(url: urlString) { data in
            let model = try? JSONDecoder().decode(Welcome.self, from: data)
            print("이건가")
            print(model ?? nil)
            
            let json = try! JSON(data: model!)
            
            let items = json["items"].array!
            
            for i in items{
                
                let id = i["id"].stringValue
                
                let title = i["volumeInfo"]["title"].stringValue
                
                let authors = i["volumeInfo"]["authors"].array!
                
                var author = ""
                
                for j in authors{
                    
                    author += "\(j.stringValue)"
                }
                
                let description = i["volumeInfo"]["description"].stringValue
                
                let imurl = i["volumeInfo"]["imageLinks"]["thumbnail"].stringValue
                
                let url1 = i["volumeInfo"]["previewLink"].stringValue
                
                DispatchQueue.main.async {
                    
                    self.data.append(VolumeInfo(id: id, title: title, authors: author, desc: description, imurl: imurl, url: url1))
                }
            }
            
        }
        
    }
}
