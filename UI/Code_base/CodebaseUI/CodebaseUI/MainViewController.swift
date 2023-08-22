//
//  MainViewController.swift
//  CodebaseUI
//
//  Created by 김소진 on 2022/11/17.
//


import UIKit

class MainViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = .preferredFont(forTextStyle: .title1, compatibleWith: .none)
        titleLabel.text = "정보 입력"
        
        return titleLabel
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = .preferredFont(forTextStyle: .body, compatibleWith: .none)
        nameLabel.text = "이름"
        
        return nameLabel
    }()
    
    private let nameField: UITextField = {
        let nameField = UITextField()
        nameField.borderStyle = .roundedRect
        nameField.textAlignment = .center
        nameField.placeholder = "이름을 입력해주세요"
        nameField.clearButtonMode = .always
        
        return nameField
    }()
    
    private let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.textColor = .black
        dateLabel.font = .preferredFont(forTextStyle: .body, compatibleWith: .none)
        dateLabel.text = "생년월일"
        
        return dateLabel
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        return datePicker
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("저장하기", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setConstraint()
        setVisualConstraint()
        setAnchorConstraint()
        
    }
    
    func setup() {
        view.backgroundColor = .white
        addViews()
    }
    
    func addViews() {
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameField)
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(button)
    }

    
    // MARK: - NSConstraint

    private func setConstraint() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 30),
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 100),
            NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 170),
            NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 80)

        ])
    }
    
    
    // MARK: - Visual Format Language
    private func setVisualConstraint() {
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
         [
        
        // top과의 높이
        NSLayoutConstraint.constraints(withVisualFormat: "V:|-(250)-[textField(200)]",
        options: .alignAllTop,
        metrics: nil,
        views: ["textField": nameField]),
        
        // leading
        NSLayoutConstraint.constraints(withVisualFormat: "H:[textField(200)]",
        options: .alignAllLeading,
        metrics: nil,
        views: ["textField": nameField]),
        
         // width
         NSLayoutConstraint.constraints(withVisualFormat: "H:[textField(250)]",
         options: .alignAllCenterX,
         metrics: nil,
         views: ["textField": nameField]),
         
         // height
         NSLayoutConstraint.constraints(withVisualFormat: "V:[sv]-(<=1.0)-[textField(30)]",
         options: .alignAllCenterX,
         metrics: nil,
         views: ["sv": view!, "textField": nameField])
        
         ].flatMap({ $0 })
        )
        
    }
    
    
    // MARK: - NSLayoutAnchor
    
    private func setAnchorConstraint() {
    
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            dateLabel.widthAnchor.constraint(equalToConstant: 100),
            dateLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            datePicker.widthAnchor.constraint(equalToConstant: 100),
            datePicker.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 270),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    
    }

    

}
