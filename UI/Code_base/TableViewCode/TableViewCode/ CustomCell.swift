//
//  CustomCell.swift
//  TableViewCode
//
//  Created by 김소진 on 2022/11/21.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"

    let img : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "cat")

        return imgView
    }()

    let label : UILabel = {
        let label = UILabel()
        label.text = "고먐미"
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor.black

        return label
    }()

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
        contentView.addSubview(img)
        contentView.addSubview(label)
    }

    private func setConstraint() {

        img.snp.makeConstraints { (make) in
            make.top.equalTo(snp_topMargin)
            make.leading.equalTo(snp_leadingMargin)
            make.bottom.equalTo(snp.bottomMargin)
            make.height.equalTo(70)
            make.width.equalTo(70)
        }

        label.snp.makeConstraints { (make) in
            make.leading.equalTo(img.snp.trailing).offset(20)
            make.centerY.equalTo(img)
            make.trailing.equalTo(-5)
        }
    }
}
