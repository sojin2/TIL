//
//  Info4PopupView.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/19.
//

import UIKit
import SnapKit
import Then

class Info4PopupView: UIView {
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
        $0.spacing = 7
    }

    private let infoTxtStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 7
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .center
        $0.text = "이름"
    }
    private let userNameInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
    }
    
    private let userNumberLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .center
        $0.text = "연락처"
    }
    private let userNumberInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
    }
    
    private let userTimeLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .center
        $0.text = "시간"
    }
    private let userTimeInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
    }
    
    private let userDistanceLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .center
        $0.text = "거리"
    }
    private let userDistanceInfoLabel = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
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
    
    let centerButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 0
        $0.layer.cornerRadius = 7
    }
    
    init(TwoBnt: Bool, image: String, title: String, name: String, number: String, time: String, distance: String, leftTitle: String, rightTitle: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: image)
        userNameInfoLabel.text = name
        userNumberInfoLabel.text = number
        userTimeInfoLabel.text = time
        userDistanceInfoLabel.text = distance
        leftButton.setTitle(leftTitle, for: .normal)
        rightButton.setTitle(rightTitle, for: .normal)
        
        super.init(frame: .zero)
        
        addSubview(popupView)
        popupView.addSubview(titleLabel)
        popupView.addSubview(imageView)
        popupView.addSubview(centerButton)
        [infoStackView, infoTxtStackView, buttonStackView].forEach(popupView.addSubview(_:))
        
        
        infoStackView.addArrangedSubview(userNameLabel)
        infoStackView.addArrangedSubview(userNumberLabel)
        infoStackView.addArrangedSubview(userTimeLabel)
        infoStackView.addArrangedSubview(userDistanceLabel)
        
        infoTxtStackView.addArrangedSubview(userNameInfoLabel)
        infoTxtStackView.addArrangedSubview(userNumberInfoLabel)
        infoTxtStackView.addArrangedSubview(userTimeInfoLabel)
        infoTxtStackView.addArrangedSubview(userDistanceInfoLabel)
        
        buttonStackView.addArrangedSubview(leftButton)
        buttonStackView.addArrangedSubview(rightButton)
        
        centerButton.isHidden = TwoBnt
        
        buttonStackView.isHidden = !TwoBnt
        
        popupView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(280)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.height.equalTo(24)
            $0.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.height.equalTo(90)
            $0.top.equalToSuperview().inset(74)
            $0.bottom.equalToSuperview().inset(106)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalTo(infoStackView.snp.left).offset(-20)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(74)
            $0.bottom.equalToSuperview().inset(106)
            $0.height.equalTo(90)
            $0.width.equalTo(42)
            $0.left.equalTo(imageView.snp.right).offset(-20)
            $0.right.equalToSuperview().inset(150)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        userNameInfoLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        userNumberLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        userNumberInfoLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        userTimeLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        userTimeInfoLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        userDistanceLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        userDistanceInfoLabel.snp.makeConstraints {
            $0.height.equalTo(19)
        }
        
        infoTxtStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(74)
            $0.bottom.equalToSuperview().inset(106)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().inset(178)
            $0.right.equalToSuperview().inset(20)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(198)
            $0.bottom.equalToSuperview().inset(30)
            $0.left.right.equalToSuperview().inset(20)
            $0.width.equalTo(260)
            $0.height.equalTo(42)
        }
        
        centerButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(198)
            $0.bottom.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(130)
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

