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
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(searchQueryString)"
        
        
        let bookRequest = viewModel.getRequest(url: urlString)
        let bookRequest2 = viewModel.getBooks(url: urlString)
        
        bookRequest.subscribe(onNext: { element in
            //print("실행은 되나22222222222222")
            // print(element)
            //print(Json[element.items])

            //print(element["volumInfo"])
            print("자료형: ", type(of:element))

        }, onCompleted: {
            print("onCompleted")
        }).disposed(by: disposeBag)
        
        
        bookRequest2.subscribe(onNext: { element in
            print("실행은 되나22222222222222")
            print(element)
            print("adsafad1111121212121212",element)
            print("자료형: ", type(of:element))

//            for element in element {
//                if let info = element.volumeInfo {
//
//                }
            // }
        }, onCompleted: {
            print("onCompleted")
        }).disposed(by: disposeBag)
    }
        
}
