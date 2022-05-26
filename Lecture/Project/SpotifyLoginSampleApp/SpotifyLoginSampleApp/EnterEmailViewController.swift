//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by HelloDigital_iOS_Dev on 2022/05/26.
//

import UIKit

class EnterEmailViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextBoutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 모양 둥글게
        nextBoutton.layer.cornerRadius = 30
        
        // TextField가 입력되지 않았을 때, 버튼 비활성화
        nextBoutton.isEnabled = false
        
        // Textfield에 입력한 text 값 자체를 받아오려면 delegate 설정 필요
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // 이메일 텍스트 필드에 자동으로 커서가 있도록
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navigation Bar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        
    }
    
}

extension EnterEmailViewController: UITextFieldDelegate {
    
    // 이메일 비밀번호 입력이 끝나고나서 return 버튼이 눌렸을때 키보드가 내려가게
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    // 입력이 끝났을때 다음 버튼 활성화
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        nextBoutton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}

