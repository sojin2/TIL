//
//  UIViewController+Alert.swift
//  SjMemo
//
//  Created by 김소진 on 2020/11/24.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", message: String) {
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil) // 버튼 생성
        alert.addAction(okAction) // 생성한 버큰을 alertcontroller에 추가
        present(alert, animated: true, completion: nil) //경고창을 화면에 표시
        
    }
}


