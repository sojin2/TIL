//
//  MainViewController.swift
//  CodebaseUI
//
//  Created by 김소진 on 2022/11/17.
//


import UIKit

class MainViewController: UIViewController {
    
    private let Titlelabel: UILabel = {
        let Titlelabel = UILabel()
        Titlelabel.textColor = .black
        Titlelabel.font = .preferredFont(forTextStyle: .title1, compatibleWith: .none)
        Titlelabel.text = "정보 입력"
        
        return Titlelabel
    }()
    
    private let namelabel: UILabel = {
        let namelabel = UILabel()
        namelabel.textColor = .black
        namelabel.font = .preferredFont(forTextStyle: .body, compatibleWith: .none)
        namelabel.text = "이름"
        
        return namelabel
    }()
    
    private let nameField: UITextField = {
        let nameField = UITextField()
        nameField.borderStyle = .roundedRect
        nameField.textAlignment = .center
        nameField.placeholder = "이름을 입력해주세요"
        nameField.clearButtonMode = .always
        
        return nameField
    }()
    
    private let datelabel: UILabel = {
        let datelabel = UILabel()
        datelabel.textColor = .black
        datelabel.font = .preferredFont(forTextStyle: .body, compatibleWith: .none)
        datelabel.text = "생년월일"
        
        return datelabel
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
        view.addSubview(Titlelabel)
        view.addSubview(namelabel)
        view.addSubview(nameField)
        view.addSubview(datelabel)
        view.addSubview(datePicker)
        view.addSubview(button)
    }

    
    // MARK: - NSConstraint

    private func setConstraint() {

        Titlelabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: Titlelabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 30),
            NSLayoutConstraint(item: Titlelabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 100),
            NSLayoutConstraint(item: Titlelabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 170),
            NSLayoutConstraint(item: Titlelabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 80)

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
    
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            namelabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            namelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            namelabel.widthAnchor.constraint(equalToConstant: 100),
            namelabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        datelabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datelabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            datelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            datelabel.widthAnchor.constraint(equalToConstant: 100),
            datelabel.heightAnchor.constraint(equalToConstant: 30)
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
