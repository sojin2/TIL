//
//  MyView.swift
//  SwiftUIPractice
//
//  Created by HelloDigital_iOS_Dev on 2022/06/21.
//

import SwiftUI

// 기능에대한 청사진 제공
// SwiftUI가 화면에 그리는 동작을 나타내게됨
struct MyView: View {
    let helloFont: Font
    
    // body의 속성이 view를 준수
    var body: some View {
        VStack{
            Text("Hello, World!").font(helloFont)
            Text("만나서 반가워요!")
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(helloFont: .title)
    }
}
