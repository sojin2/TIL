//
//  ViewController.swift
//  BooksSearch
//
//  Created by 김소진 on 2022/11/29.
//

import Foundation

import UIKit
import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    let viewModel = BookViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadData()
    }


    private func loadData() {
        
        let searchQueryString = "flowers"
        let urlString = "https://www.googleapis.com/books/v1/volumes?key=AIzaSyCZ8OABGtFqbRHmzRUsxMUsB5eCEGbZiic&q=\(searchQueryString)"
        
        
           let bookRequest = viewModel.getRequest(url: urlString)
        
                bookRequest.subscribe(onNext: { element in
                    print("실행은 되나22222222222222")
                    print(element)
                }, onCompleted: {
                    print("onCompleted")
                }).disposed(by: disposeBag)
        

    }
}
