//
//  PageViewController.swift
//  InterfacingwithUIKit
//
//  Created by 김소진 on 2022/12/01.
//

import SwiftUI
import UIKit

// UIViewControllerRepresentable: UIKit ViewController를 나타내는 view
// SwiftUI에서 UIkit의 인스턴스를 이용하여 개체를 만들고 관리할 수 있도록 해주는 protocol
// UIKit과 동일한 생명주기 가짐
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    // viewController와 SwiftUI의 변경 사항(다른 부분) 전달
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // SwiftU가 View를 표시할 준비가 되었을 때 한 번 호출함
    // 그 후 ViewController의 생명주기를 관리
    // context는 system의 현재 상태에대한 정보를 가지고 있음
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
            return pageViewController
    }
    
    // UIHostingController : SwiftUI view를 UIKit view 계층 구조에 통합하려는 경우 생성
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],direction: .forward, animated: true)
    }
    
    // Coordinator: UIViewControllerRepresentable protocol에서 필수로 선언해야하는 클래스로 viewController와 통합 혹은 대등하게 하는 class 입니다.
    class Coordinator: NSObject,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count{
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
    
}
