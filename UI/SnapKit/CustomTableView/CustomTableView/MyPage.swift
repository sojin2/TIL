//
//  MyPage.swift
//  CustomTableView
//
//  Created by 김소진 on 11/30/23.
//

import SnapKit
import Then
import UIKit

class MyPage: UIViewController {


    private let infoView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 9
    }
    
    private let imgChangeBtn = UIButton().then {
        $0.layer.cornerRadius = 49
    }
    
    private let userImg = UIImageView().then {
        $0.layer.cornerRadius = 49
    }

    
    private let userName = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 20)
        $0.tintColor = .black
        $0.textAlignment = .center
    }
    
    private let userPhoneNum = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 20)
        $0.tintColor = .black
        $0.textAlignment = .center
    }

    
    let qrBtn = UIButton().then {
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
        $0.setTitle("나의 QR", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 0
        $0.layer.cornerRadius = 7
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        view.backgroundColor = .gray
        addViews()
        
    }
    
    // 아래에 있을수록 view 제일 위에 뜸
    func addViews() {
        view.addSubview(infoView)
        infoView.addSubview(userImg)
        infoView.addSubview(userName)
        infoView.addSubview(userPhoneNum)
        
        infoView.addSubview(imgChangeBtn)
        

        infoView.addSubview(qrBtn)
        setConstraint()
    }
    
    private func setConstraint() {
        
        infoView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.width.equalTo(280)
//            $0.bottom.equalTo(okEditBtn.snp.top).offset(-10)
        }
        
        userImg.snp.makeConstraints{
            $0.top.equalTo(infoView.snp.bottom).offset(-20)
            $0.centerX.equalToSuperview()
        }
        
        imgChangeBtn.snp.makeConstraints{
            $0.top.equalTo(infoView.snp.bottom).offset(-20)
            $0.centerX.equalToSuperview()
        }
        
        
        qrBtn.snp.makeConstraints{
            $0.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.right.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }

    }
    
}

