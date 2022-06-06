//
//  ViewController.swift
//  LampAlert
//
//  Created by 김소진 on 2021/12/05.
//

import UIKit

class AlertViewController: UIViewController {
    @IBOutlet weak var lampImage: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp_remove.png")
    
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImage.image = imgOn
    }

    @IBAction func btnOn(_ sender: UIButton) {
        
        if isLampOn {
            let onAlert  = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: .alert)
            let actionOn = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            
            onAlert.addAction(actionOn)
            present(onAlert, animated: true, completion: nil)
        }else {
            lampImage.image = imgOn
            isLampOn = true
        }
        
        
    }
    
    @IBAction func btnOff(_ sender: UIButton) {
        
        if isLampOn {
            
            
            let offAlert  = UIAlertController(title: "램프 끄기", message: "램프를 끄겠습니까?", preferredStyle: .alert)
        
            let actionOff = UIAlertAction(title: "네", style: .default, handler: {action in
                self.lampImage.image = self.imgOff
                self.isLampOn = false
            })
            
            let actionCancel = UIAlertAction(title: "아니요", style: .default, handler: nil)
            
            offAlert.addAction(actionOff)
            offAlert.addAction(actionCancel)
            
            present(offAlert, animated: true, completion: nil)
            
        } else {
            let offAlert  = UIAlertController(title: "경고", message: "현재 Off 상태입니다.", preferredStyle: .alert)
            let actionOff = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            
            offAlert.addAction(actionOff)
            present(offAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        let removeAlert  = UIAlertController(title: "램프 제거?", message: "램프를 제거 할까요?", preferredStyle: .alert)
    
        let actionOn = UIAlertAction(title: "아니요, 끕니다!", style: .default, handler: {action in
            self.lampImage.image = self.imgOff
        })
        
        let actionOff = UIAlertAction(title: "아니요, 켭니다!", style: .default, handler: {action in
            self.lampImage.image = self.imgOn
        })
        
        let actionRemove = UIAlertAction(title: "네, 제거합니다!", style: .default, handler: {action in
            self.lampImage.image = self.imgRemove
        })
        
        removeAlert.addAction(actionOn)
        removeAlert.addAction(actionOff)
        removeAlert.addAction(actionRemove)
        
        
        present(removeAlert, animated: true, completion: nil)
        
    }
    
}

