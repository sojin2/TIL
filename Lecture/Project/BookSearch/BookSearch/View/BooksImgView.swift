//
//  BooksImgView.swift
//  BookSearch
//
//  Created by 김소진 on 2022/11/12.
//

import SwiftUI
import URLImage

struct BooksImgView: View {
    var imageUrl: URL
    
    var body: some View {
        URLImage(imageUrl,
                 content: { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 })
            .frame(width: 50, height: 60)
            .clipShape(Circle())
            .overlay(Rectangle().frame(width: 100, height: 100))
    }

}

struct BooksImgView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "\(BooksViewModel.)")!
        
        BooksImgView(imageUrl: url)
    }
}
