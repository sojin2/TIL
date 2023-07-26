//
//  PageControl.swift
//  InterfacingwithUIKit
//
//  Created by 김소진 on 2022/12/02.
//

import SwiftUI
import UIKit

// UIViewRepresentable: SwiftUI view 계층을 통합하는데 사용하는 UIKit view wrapper
// SwiftUI에서 UIkit의 인스턴스를 이용하여 개체를 만들고 관리할 수 있도록 해주는 protocol
// UIKit과 동일한 생명주기 가짐
struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        // 특정 이벤트 대상 및 액션 추가
        control.addTarget(context, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    

    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        // UIControl의 하위 클래스인 UIPageControl은 delegate를 하지 않고 target - action을 사용함
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}


