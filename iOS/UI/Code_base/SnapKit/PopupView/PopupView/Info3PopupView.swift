//
//  Info3PopupView.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/19.
//

import UIKit
import SnapKit
import Then

class Info3PopupView: UIView {
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
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 9
    }
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }

    private let infoTxtStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    private let nameLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
        $0.text = "자산명"
    }
    private let nameInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
    }
    
    private let typeLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
        $0.text = "종류"
    }
    private let typeInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
    }
    
    private let standardLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
        $0.text = "종류"
    }
    private let standardInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
    }
   
    private let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
    }
    
    let leftButton = UIButton().then {
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(UIColor.darkGray, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    let rightButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 0
        $0.layer.cornerRadius = 7
    }

    
    init(title: String, image: String, name: String, type: String, standard: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: image)
        nameInfoLabel.text = name
        typeInfoLabel.text = type
        standardInfoLabel.text = standard
        
        super.init(frame: .zero)
        
        addSubview(popupView)
        popupView.addSubview(titleLabel)
        popupView.addSubview(imageView)
        [infoStackView, infoTxtStackView, buttonStackView].forEach(popupView.addSubview(_:))
        
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(typeLabel)
        infoStackView.addArrangedSubview(standardLabel)
        
        infoTxtStackView.addArrangedSubview(nameInfoLabel)
        infoTxtStackView.addArrangedSubview(typeInfoLabel)
        infoTxtStackView.addArrangedSubview(standardInfoLabel)
        
        buttonStackView.addArrangedSubview(leftButton)
        buttonStackView.addArrangedSubview(rightButton)
        
        
        popupView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(230)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.height.equalTo(24)
            $0.centerX.equalToSuperview()
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
            $0.top.equalToSuperview().inset(70)
            $0.bottom.equalToSuperview().inset(85)
            $0.height.equalTo(73)
            $0.width.equalTo(42)
            $0.left.equalTo(imageView.snp.right).offset(-20)
            $0.right.equalToSuperview().inset(150)
        }
        
        nameLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        nameInfoLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }

        typeLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        typeInfoLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        
        standardLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        standardInfoLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        
        
        infoTxtStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.bottom.equalToSuperview().inset(85)
            $0.height.equalTo(73)
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
