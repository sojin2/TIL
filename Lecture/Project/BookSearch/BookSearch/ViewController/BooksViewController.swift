//
//  BooksViewController.swift
//  BookSearch
//
//  Created by 김소진 on 2022/11/12.
//

import UIKit
import Foundation
import Alamofire
import RxSwift

final class BooksViewController: UIViewController {
    let disposeBag = DisposeBag()
    let viewModel = BooksViewModel()
    
    
    
    override func viewDidLoad() {
        self.loadData()
    }
    
    private func loadData() {
        
        let searchQueryString = "flowers"
        let urlString = "https://www.googleapis.com/books/v1/volumes?key=AIzaSyCZ8OABGtFqbRHmzRUsxMUsB5eCEGbZiic&q=\(searchQueryString)"

        let bookRequest = viewModel.getRequest(url: urlString)
        
        
        bookRequest.subscribe(onNext: { element in
            print("실행은 되나")
            print(element)
        }, onCompleted: {
            print("onCompleted")
        }).disposed(by: disposeBag)
        
    }
    
}
