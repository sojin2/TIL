//
//  BookRowView.swift
//  BookSearch
//
//  Created by 김소진 on 2022/11/12.
//

import SwiftUI

struct BookRowView: View {
    
    var books : VolumeInfo?
    var image : ImageLinks?
    
    var body: some View {
        HStack{

            BookImgView(imageUrl: URL(string: "\(image!.smallThumbnail)")!)
            Text("\(books!.title)")
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .minimumScaleFactor(0.5)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading).padding(.vertical)
    }
}


struct BooksRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView()
    }
}
