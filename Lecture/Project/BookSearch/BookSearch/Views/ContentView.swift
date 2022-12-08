//
//  ContentView.swift
//  BookSearch
//
//  Created by 김소진 on 2022/11/11.
//

import SwiftUI
import Foundation
import Alamofire
import RxSwift

struct ContentView: View {
    @ObservedObject var viewModel = BooksViewModel()
    var viewController = BooksViewController()
    @State var searchQueryString = ""
    var Books = getData()

    var body: some View {
        NavigationView {
            List(Books.data) { data in
                BookRowView(books: data)
        }
            .listStyle(.plain)
            .navigationTitle("책 검색 📚")
            //책 검색 📚
            
        }
        .searchable(
            text: $searchQueryString,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "검색어를 입력해주세요"
        )
        .onSubmit(of: .search) {
            print("검색 완료: \(searchQueryString)")
        }
        .onChange(of: searchQueryString) { newValue in
            print("검색 입력: \(newValue)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class getData: ObservableObject {
    let disposeBag = DisposeBag()
    let viewModel = BooksViewModel()
    @Published var data = [VolumeInfo]()

    
    init() {
        let searchQueryString = "flowers"
        let urlString = "https://www.googleapis.com/books/v1/volumes?key=AIzaSyCZ8OABGtFqbRHmzRUsxMUsB5eCEGbZiic&q=\(searchQueryString)"
        
        let bookRequest = viewModel.getRequest(url: urlString)
        
        
        bookRequest.subscribe(onNext: { element in
            print("되나")
            print(element)
        }, onCompleted: {
            print("onCompleted")
        }).disposed(by: disposeBag)
        
    }
    
}
