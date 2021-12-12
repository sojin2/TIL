//
//  ViewController.swift
//  Gugudan
//
//  Created by 김소진 on 2021/12/05.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var lblLadomNum1: UILabel!
    @IBOutlet weak var lblLadomNum2: UILabel!
    @IBOutlet weak var tfResult: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLadomNum1.text = mul()
        lblLadomNum2.text = mul()
    }

    func mul() -> String {
        return String(Int.random(in: 1...9))
    }
    
    @IBAction func bntNumResult(_ sender: UIButton) {
        
        let answer: Int = Int(lblLadomNum1.text!)! * Int(lblLadomNum2.text!)!
        let result: Int = Int(tfResult.text!)!
        
        if answer == result {
            resultOK()
        }
        
        if answer != result {
            resultMiss()
        }
    }
    func resultOK() {
        let calcOnAlert = UIAlertController(title: "결과", message: "정답입니다.", preferredStyle: .alert)
        let onAction = UIAlertAction(title: "다음 문제 진행", style: .default, handler: {ACTION in
            self.tfResult.text = ""
            self.lblLadomNum1.text = self.mul()
            self.lblLadomNum2.text = self.mul()
            
        })
        
        calcOnAlert.addAction(onAction)
        present(calcOnAlert, animated: true, completion: nil)
        
        
    }
    
func resultMiss() {
    let calcOffAlert = UIAlertController(title: "결과", message: "실패입니다.", preferredStyle: .alert)
    let offAction = UIAlertAction(title: "다시 풀어보세요.", style: .default, handler: {ACTION in
        self.tfResult.text = ""
        
    })
    
    calcOffAlert.addAction(offAction)
    present(calcOffAlert, animated: true, completion: nil)
    
    
}
    

}

