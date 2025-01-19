//
//  StaffCell.swift
//  CustomTableView
//
//  Created by 김소진 on 11/30/23.
//

import UIKit
import SnapKit
import Then

class StaffCell: UITableViewCell {

    static let identifier = "StaffCell"

    let staffImg = UIImageView().then {
        $0.image = UIImage(named: "cat")
        $0.layer.cornerRadius = 9
    }
    
    let staffInfoView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 6
    }

    let staffpName = UILabel().then {
        $0.text = "김소진"
        $0.font = .fontWithName(type: .bold, size: 17)
        $0.textColor = UIColor.black
    }
    
    let staffPhoneNumber = UILabel().then {
        $0.text = "01082592164"
        $0.font = .fontWithName(type: .medium, size: 14)
        $0.textColor = UIColor.gray
    }
    
    
    let staffAttendOnView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 6

    }
    
    let staffAttendOnImg = UIImageView().then {
        $0.image = UIImage(named: "circle")
    }
    let staffAttendOnTime = UILabel().then {
        $0.text = "11:00"
        $0.font = .fontWithName(type: .regular, size: 14)
        $0.textColor = UIColor.black
    }
    
    
    let staffAttendOffView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 6
    }
    
    let staffAttendOffImg = UIImageView().then {
        $0.image = UIImage(named: "circle")
        $0.tintColor = .red
    }
    
    let staffAttendOffTime = UILabel().then {
        $0.text = "19:00"
        $0.font = .fontWithName(type: .regular, size: 14)
        $0.textColor = UIColor.gray
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
        contentView.addSubview(staffImg)
        
        [staffInfoView, staffAttendOnView, staffAttendOffView].forEach(contentView.addSubview(_:))
        
        staffInfoView.addArrangedSubview(staffpName)
        staffInfoView.addArrangedSubview(staffPhoneNumber)
        
        staffAttendOnView.addArrangedSubview(staffAttendOnImg)
        staffAttendOnView.addArrangedSubview(staffAttendOnTime)
        
        staffAttendOffView.addArrangedSubview(staffAttendOffImg)
        staffAttendOffView.addArrangedSubview(staffAttendOffTime)
    }

    private func setConstraint() {

        staffImg.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.bottom.equalTo(snp.bottomMargin)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        staffInfoView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(staffImg.snp.trailing).offset(20)
            $0.trailing.equalTo(staffAttendOnView.snp.leading).offset(-20)
            $0.height.equalTo(52)
        }
        
        
        staffAttendOnView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(staffInfoView.snp.trailing)
            $0.trailing.equalTo(staffAttendOffView.snp.leading).offset(20)
            $0.width.equalTo(100)
            $0.height.equalTo(26)
        }
        
        staffAttendOffView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(staffAttendOnView.snp.trailing).inset(20)
            $0.trailing.equalToSuperview().offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(26)
        }
        
        staffAttendOnImg.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.width.equalTo(8)
        }
        
        staffAttendOffImg.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.width.equalTo(8)
        }


    }
}
