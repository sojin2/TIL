//
//  ViewController.swift
//  SnapKitUI
//
//  Created by 김소진 on 2022/11/19.
//

import UIKit
import SnapKit

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

        Titlelabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view).offset(30)
            make.top.equalTo(self.view).offset(150)
            make.width.equalTo(170)
            make.height.equalTo(80)
        }

        
        namelabel.snp.makeConstraints{ (make) in
            make.top.equalTo(Titlelabel.snp.bottom).offset(20)
            make.leading.equalTo(self.view).offset(50)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        

        nameField.snp.makeConstraints{ (make) in
            make.top.equalTo(Titlelabel.snp.bottom).offset(20)
            make.leading.equalTo(namelabel.snp.trailing).offset(10)
            make.width.equalTo(250)
            make.height.equalTo(30)
        }
        


        datelabel.snp.makeConstraints{ (make) in
            make.top.equalTo(namelabel.snp.bottom).offset(20)
            make.leading.equalTo(self.view).offset(50)
            make.width.equalTo(70)
            make.height.equalTo(30)
        }

        
         
        datePicker.snp.makeConstraints{ (make) in            make.top.equalTo(nameField.snp.bottom).offset(20)
            make.leading.equalTo(datelabel.snp.trailing).offset(10)
            make.width.equalTo(80)
        }

        
        button.snp.makeConstraints{ (make) in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.leading.equalTo(self.view).offset(270)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }

    }

}
