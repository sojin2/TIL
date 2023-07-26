//
//  headerView.swift
//  SnapKitUI
//
//  Created by 김소진 on 2023/07/18.
//

import SnapKit
import UIKit
import Then

class headerView: UIView {
    
    private let headerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let bodyStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    private let leftBtn = UIButton().then {
        $0.tintColor = .black
        $0.layer.cornerRadius = 7
    }
    
    private let rightBtn = UIButton().then {
        $0.tintColor = .black
        $0.layer.cornerRadius = 7
    }
    
    init(title: String, leftImg: String, rightImg: String) {
        titleLabel.text = title
        leftBtn.setImage(UIImage(named: leftImg), for: .normal)
        rightBtn.setImage(UIImage(named: rightImg), for: .normal)
        super.init(frame: .zero)
        
        
        addSubview(headerView)
        
        headerView.addSubview(titleLabel)
        headerView.addSubview(leftBtn)
        headerView.addSubview(rightBtn)
        
        
        headerView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.height.equalTo(60)
        }

        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(leftBtn.snp.trailing)
            $0.trailing.equalTo(rightBtn.snp.leading)
            $0.centerY.equalTo(headerView)
        }
        
        leftBtn.snp.makeConstraints {
            $0.leading.equalTo(headerView.snp.leading)
            $0.centerY.equalTo(headerView.snp.centerY)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        rightBtn.snp.makeConstraints {
            $0.trailing.equalTo(headerView.snp.trailing).inset(0)
            $0.centerY.equalTo(headerView.snp.centerY)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

