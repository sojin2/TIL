//
//  PopupView.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/18.
//

import UIKit
import SnapKit
import Then

class PopupView: UIView {
    private let popupView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
    }
    
    private let labelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
    }
    
    private let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 20)
        $0.tintColor = .black
        $0.textAlignment = .center
    }
    
    private let subLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .center
    }
    
    
    private let leftButton = UIButton().then {
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitleColor(UIColor.darkGray, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    private let rightButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 0
        $0.layer.cornerRadius = 7
    }
    
    private let centerButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 0
        $0.layer.cornerRadius = 7
    }
    
    init(TwoBnt: Bool, title: String, sub: String, leftTitle: String, rightTitle: String) {
        titleLabel.text = title
        subLabel.text = sub
        leftButton.setTitle(leftTitle, for: .normal)
        rightButton.setTitle(rightTitle, for: .normal)
        super.init(frame: .zero)
        
        addSubview(popupView)
        popupView.addSubview(centerButton)
        [labelStackView, buttonStackView].forEach(popupView.addSubview(_:))
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(subLabel)
        buttonStackView.addArrangedSubview(leftButton)
        buttonStackView.addArrangedSubview(rightButton)
        
        centerButton.isHidden = TwoBnt
        
        buttonStackView.isHidden = !TwoBnt
        
        popupView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(180)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        labelStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.left.right.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(93)
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        subLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }

        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(118)
            $0.bottom.equalToSuperview().inset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(42)
        }
        
        centerButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(118)
            $0.bottom.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(130)
            $0.height.equalTo(42)
        }
        

        leftButton.snp.makeConstraints {
            $0.width.equalTo(122)
        }

        rightButton.snp.makeConstraints {
            $0.width.equalTo(122)
        }
        
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
}
