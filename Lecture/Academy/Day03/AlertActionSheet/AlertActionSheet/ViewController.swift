//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by 김소진 on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAlert(_ sender: UIButton) {
        // UIAlertController 초기화
        let testAlert  = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
    
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: {action in
            print("default action is called!")
        })
        
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: { ACTION in
            print("destructive action is called!")
        })
        
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: nil)
        
        
        // UIAlertController 에 UIAlertAction 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        present(testAlert, animated: true, completion: nil)
        
    }
                                           
    
    
    @IBAction func btnActionSheet(_ sender: UIButton) {
        // UIAlertController 초기화
        let testAlert  = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
    
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: {action in
            print("default action is called!")
        })
        
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: { ACTION in
            print("destructive action is called!")
        })
        
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: nil)
        
        
        // UIAlertController 에 UIAlertAction 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        present(testAlert, animated: true, completion: nil)
        
    }
}

