//
//  Info4PopupViewController.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/19.
//


import UIKit
import SnapKit
import Then

class Info4PopupViewController: UIViewController {
    private let info4PopupView: Info4PopupView

    init(TwoBnt: Bool, image: String, title: String, name: String, number: String, time: String, distance: String, leftTitle: String, rightTitle: String) {
            info4PopupView = Info4PopupView(TwoBnt: TwoBnt, image: image, title: title, name: name, number: number, time: time, distance: distance, leftTitle: leftTitle, rightTitle: rightTitle)
          
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .clear
        view.addSubview(info4PopupView)
        
        info4PopupView.rightButton.addTarget(self, action: #selector(onClose), for: .touchUpInside)
        info4PopupView.centerButton.addTarget(self, action: #selector(onClose), for: .touchUpInside)
        
        info4PopupView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc private func onClose() {
        self.dismiss(animated: true, completion: nil)
    }
  
  required init?(coder: NSCoder) { fatalError() }
}

