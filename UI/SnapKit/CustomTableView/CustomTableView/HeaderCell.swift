//
//  HeaderCell.swift
//  CustomTableView
//
//  Created by 김소진 on 11/30/23.
//

import UIKit
import SnapKit
import Then

class HeaderCell: UITableViewCell {

    static let identifier = "HeaderCell"

    let headerView = UIView()

    let total = UILabel().then {
        $0.text = "17개"
        $0.font = .fontWithName(type: .bold, size: 17)
        $0.textColor = UIColor.black
    }
    
    let leftitle = UILabel().then {
        $0.text = "출근"
        $0.font = .fontWithName(type: .medium, size: 14)
        $0.textColor = UIColor.black
    }
    
    let rightTitle = UILabel().then {
        $0.text = "퇴근"
        $0.font = .fontWithName(type: .medium, size: 14)
        $0.textColor = UIColor.black
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
        contentView.addSubview(headerView)
        headerView.addSubview(total)
        headerView.addSubview(leftitle)
        headerView.addSubview(rightTitle)
    }

    private func setConstraint() {
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        total.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.height.equalTo(19)
        }
        
        leftitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(total.snp.trailing).offset(100)
            $0.trailing.equalTo(rightTitle.snp.leading).offset(-70)
            $0.height.equalTo(52)
        }
        
        
        rightTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(leftitle.snp.trailing).inset(70)
            $0.trailing.equalToSuperview().offset(-32)
            $0.width.equalTo(50)
        }
        


    }
}
