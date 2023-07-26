//
//  BlueButton.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/18.
//
import UIKit
import SnapKit
import Then

class BlueButton: UIButton {
    
    private let BlueButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 7
    }

    
    init(title: String, width: Int, height: Int) {
        BlueButton.setTitle(title, for: .normal)
        

        super.init(frame: .zero)
        
        BlueButton.snp.makeConstraints {
            $0.height.equalTo(height)
            $0.width.equalTo(width)
        }
        
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
}
