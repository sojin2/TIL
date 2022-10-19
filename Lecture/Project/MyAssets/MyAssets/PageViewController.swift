//
//  PageViewController.swift
//  MyAssets
//
//  Created by 김소진 on 2022/10/20.
//

import SwiftUI
import UIKit

struct PageViewController: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PageViewController_Previews: PreviewProvider {
    static var previews: some View {
        PageViewController()
    }
}
