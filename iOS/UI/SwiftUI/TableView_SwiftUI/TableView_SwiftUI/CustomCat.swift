//
//  CustomCat.swift
//  TableView_SwiftUI
//
//  Created by 김소진 on 2022/12/03.
//

import SwiftUI

struct CustomCat: View {
    var cellNum: Int
    
    var body: some View {
        HStack {
            NavigationLink(destination: DetailView()) {
                Image("cat")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("고먐미 \(cellNum)")
                
                Spacer()
            }
        }
        
    }

}


struct FooterView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("주의 사항")
                .bold()
            Text("조심조심 주의해주세요!")
        }.padding(.top,10.0)
    }
}

struct DetailView: View {
    var body: some View {
        Image("detailCat")
            .resizable()
    }
}

struct CustomCat_Previews: PreviewProvider {
    static var previews: some View {
        CustomCat(cellNum: 1)
    }
}
