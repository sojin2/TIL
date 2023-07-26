//
//  Info3PopupViewController.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/19.
//

import UIKit
import SnapKit
import Then

class Info3PopupViewController: UIViewController {
    private let info3PopupView: Info3PopupView
    
    init(title: String, image: String, name: String, type: String, standard: String) {
        info3PopupView = Info3PopupView(title: title, image: image, name: name, type: type, standard: standard)
      
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .clear
        view.addSubview(info3PopupView)
        
        info3PopupView.rightButton.addTarget(self, action: #selector(onClose), for: .touchUpInside)
        
        info3PopupView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
  }
    
    @objc private func onClose() {
        self.dismiss(animated: true, completion: nil)
    }
  
  required init?(coder: NSCoder) { fatalError() }
}


