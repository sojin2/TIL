//
//  EquipCell.swift
//  CustomTableView
//
//  Created by 김소진 on 11/30/23.
//

import UIKit
import SnapKit
import Then

class EquipCell: UITableViewCell {

    static let identifier = "EquipCell"

    let equipImg = UIImageView().then {
        $0.image = UIImage(named: "cat")
        $0.layer.cornerRadius = 5
    }
    
    let equipInfoView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 6
    }

    let equipName = UILabel().then {
        $0.text = "보쉬 전동드릴"
        $0.font = .fontWithName(type: .bold, size: 17)
        $0.textColor = UIColor.black
    }
    
    let equipType = UILabel().then {
        $0.text = "전동드릴"
        $0.font = .fontWithName(type: .medium, size: 14)
        $0.textColor = UIColor.gray
    }
    
    let equipScanView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 6
    }
    
    let equipScanImg = UIImageView().then {
        $0.image = UIImage(named: "icqrCode")
    }
    
    
    let equipScanTime = UILabel().then {
        $0.text = "2시간 전"
        $0.font = .fontWithName(type: .medium, size: 14)
        $0.textColor = UIColor.blue
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addViews()
    }

    private func addViews() {
        contentView.addSubview(equipImg)
        
        [equipInfoView, equipScanView].forEach(contentView.addSubview(_:))
        
        equipInfoView.addArrangedSubview(equipName)
        equipInfoView.addArrangedSubview(equipType)
        
        equipScanView.addArrangedSubview(equipScanImg)
        equipScanView.addArrangedSubview(equipScanTime)
    }

    private func setConstraint() {

        equipImg.snp.makeConstraints {
            $0.top.equalTo(snp_topMargin)
            $0.leading.equalTo(snp_leadingMargin)
            $0.bottom.equalTo(snp.bottomMargin)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        equipInfoView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(equipImg.snp.trailing).offset(20)
            $0.trailing.equalTo(equipScanView.snp.leading).offset(-20)
            $0.height.equalTo(52)
        }
        
        
        equipScanView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(equipScanView.snp.trailing).inset(20)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.equalTo(50)
        }
        
        equipScanImg.snp.makeConstraints {
            $0.width.equalTo(25)
            $0.height.equalTo(25)
        }
        equipScanTime.snp.makeConstraints {
            $0.height.equalTo(14)
        }
        


    }
}
