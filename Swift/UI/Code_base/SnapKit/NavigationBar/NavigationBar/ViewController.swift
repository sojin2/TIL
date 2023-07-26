//
//  ViewController.swift
//  NavigationBar
//
//  Created by 김소진 on 2023/07/18.
//
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let header = headerView(title: "공지 및 안전사항", leftImg: "icBack", rightImg: "icRefresh")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.backgroundColor = .white
        addViews()
    }
    
    func addViews() {
        view.addSubview(header)
        setConstraint()
    }
    
    private func setConstraint() {
        
        header.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(0)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(0)
            $0.height.equalTo(115)
        }
    }
    
}
