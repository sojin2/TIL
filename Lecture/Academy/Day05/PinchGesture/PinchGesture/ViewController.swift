//
//  ViewController.swift
//  PinchGesture
//
//  Created by 김소진 on 2021/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Pinch Setup
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
        
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale , y: pinch.scale) // 얼마나 줄일래?
        pinch.scale = 1 // 다음 변환을 위해 scale의 속성을 1로 설정
        
    }
    
    // 사진 확대는 option키 누르고 하면 된다
    
    
    


}

