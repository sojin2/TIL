//
//  SetButton.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/18.
//

import UIKit
import SnapKit
import Then

class WhiteButton: UIButton {
    
    private let WhiteButton = UIButton().then {
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.layer.borderColor = UIColor.darkGray.cgColor
    }

    
    init(title: String, width: Int, height: Int) {
        WhiteButton.setTitle(title, for: .normal)

        super.init(frame: .zero)
        
        WhiteButton.snp.makeConstraints {
            $0.height.equalTo(height)
            $0.width.equalTo(width)
        }
        
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
}
