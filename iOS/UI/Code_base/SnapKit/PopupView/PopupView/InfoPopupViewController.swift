//
//  InfoPopupViewController.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/19.
//

import UIKit
import SnapKit
import Then

class InfoPopupViewController: UIViewController {
    private let info2PopupView: InfoPopupView

    init(TwoBnt: Bool, image: String, title: String, name: String, number: String, leftTitle: String, rightTitle: String) {
        info2PopupView = InfoPopupView(title: title, image: image, name: name, number: number, leftTitle: leftTitle, rightTitle: rightTitle)
      
        super.init(nibName: nil, bundle: nil)
    
        view.backgroundColor = .clear
        view.addSubview(info2PopupView)
    
        info2PopupView.rightButton.addTarget(self, action: #selector(onClose), for: .touchUpInside)
        
        info2PopupView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
  }
    
  @objc private func onClose() {
      self.dismiss(animated: true, completion: nil)
  }
  
  required init?(coder: NSCoder) { fatalError() }
}
