//
//  BookList.swift
//  BooksSearch
//
//  Created by 김소진 on 2022/11/29.
//

import SwiftUI

struct BookList: View {
    @EnvironmentObject var bookData: BookViewModel
    
    var body: some View {
        NavigationView{
            List {
                ForEach(Welcome)
            }
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}
