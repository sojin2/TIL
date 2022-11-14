//
//  ContentView.swift
//  NetflixStyleSampleApp
//
//  Created by HelloDigital_iOS_Dev on 2022/06/21.
//

import SwiftUI

struct ContentView: View {
    let titles = ["Netflix Sample App"]
    var body: some View {
        NavigationView {
            List(titles, id: \.self) {
                // HomeViewController가 뜨도록
                let netflixVC = HomeViewControllerRepresentable()
                    .navigationBarHidden(true) // List에 네비게이션 바가 뜨지 않도록 설정
                    .edgesIgnoringSafeArea(.all) // 전체화면 꽉 채우기
                
                // NavigationLink = show = push = 새로운 viewcontroller 보여주는 역할
                NavigationLink($0 ,destination: netflixVC)
            }
            .navigationTitle("SwiftUI to UIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
