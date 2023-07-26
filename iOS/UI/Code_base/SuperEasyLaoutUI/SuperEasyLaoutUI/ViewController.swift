//
//  ViewController.swift
//  SuperEasyLaoutUI
//
//  Created by 김소진 on 2022/11/19.
//

import UIKit
import SuperEasyLayout

class ViewController: UIViewController {
    
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
    
    private func setConstraint() {
        
        Titlelabel.centerX == view.centerX + 35
        Titlelabel.top == view.top + 150
        Titlelabel.width == 170.0
        Titlelabel.height == 80.0
        
        namelabel.top == Titlelabel.bottom + 20
        namelabel.leading == view.leading + 50
        namelabel.width == 50.0
        namelabel.height == 30.0

        nameField.top == Titlelabel.bottom + 20
        nameField.leading == namelabel.trailing + 10
        nameField.width == 250.0
        nameField.height == 30.0
        
        datelabel.top == namelabel.bottom + 20
        datelabel.leading == view.leading + 50
        datelabel.width == 70.0
        datelabel.height == 30.0


        datePicker.top == nameField.bottom + 20
        datePicker.leading == datelabel.trailing + 10
        datePicker.width == 80

        button.top == datePicker.bottom + 20
        button.leading == view.leading + 270
        button.width == 80.0
        button.height == 30.0
        
        
    }
}
