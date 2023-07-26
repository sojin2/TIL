//
//  InfoPopupView.swift
//  InfoPopupView
//
//  Created by 김소진 on 2023/07/19.
//


import UIKit
import SnapKit
import Then

class InfoPopupView: UIView {
    private let popupView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 20)
        $0.tintColor = .black
        $0.textAlignment = .center
    }
    
    private let imageView = UIImageView().then {
        $0.backgroundColor = .red
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 9
    }
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
    }
    
    private let infoTxtStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
    }
    
    private let nameLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
        $0.text = "이름"
    }
    
    private let nameInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
    }
    
    private let numberLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
        $0.text = "연락처"
    }
    private let numberInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
    }
    
    private let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
    }
    
    private let leftButton = UIButton().then {
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitleColor(UIColor.darkGray, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    let rightButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 0
        $0.layer.cornerRadius = 7
    }
    
    
    init(title: String, image: String, name: String, number: String, leftTitle: String, rightTitle: String) {
        titleLabel.text = title
        leftButton.setTitle(leftTitle, for: .normal)
        rightButton.setTitle(rightTitle, for: .normal)
        nameInfoLabel.text = name
        numberInfoLabel.text = number
        imageView.image = UIImage(named: image)
        super.init(frame: .zero)
        
        addSubview(popupView)
        popupView.addSubview(titleLabel)
        popupView.addSubview(imageView)
        [infoStackView, infoTxtStackView, buttonStackView].forEach(popupView.addSubview(_:))
        
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(numberLabel)
        
        infoTxtStackView.addArrangedSubview(nameInfoLabel)
        infoTxtStackView.addArrangedSubview(numberInfoLabel)
        
        buttonStackView.addArrangedSubview(leftButton)
        buttonStackView.addArrangedSubview(rightButton)
        
        
        popupView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(228)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(180)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(70)
            $0.height.equalTo(70)
            $0.top.equalToSuperview().inset(72)
            $0.bottom.equalToSuperview().inset(86)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalTo(infoStackView.snp.left).offset(-20)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.bottom.equalToSuperview().inset(98)
            $0.height.equalTo(50)
            $0.width.equalTo(42)
            $0.left.equalTo(imageView.snp.right).offset(-20)
            $0.right.equalToSuperview().inset(150)
        }
        
        nameLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(19)
        }
        nameInfoLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(19)
        }

        numberLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        numberInfoLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        
        infoTxtStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.bottom.equalToSuperview().inset(98)
            $0.height.equalTo(50)
            $0.left.equalToSuperview().inset(162)
            $0.right.equalToSuperview().inset(20)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(166)
            $0.bottom.equalToSuperview().inset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.width.equalTo(260)
            $0.height.equalTo(42)
        }
        
        leftButton.snp.makeConstraints {
            $0.width.equalTo(90)
        }

        rightButton.snp.makeConstraints {
            $0.width.equalTo(158)
        }
        
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
}
