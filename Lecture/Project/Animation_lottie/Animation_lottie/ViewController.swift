//
//  ViewController.swift
//  Animation_lottie
//
//  Created by HelloDigital_iOS_Dev on 2022/06/17.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var lottieView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AnimationView - Lottie가 가지고 올 Json 파일 지정
        let animationView = AnimationView(name: "enjoying-sloth")
        
        // view 구성
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        
        // 어떻게 반복을 줄 것인지
        animationView.loopMode = .loop
        
        // Applying UIView animation
        let minimizeTransform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        animationView.transform = minimizeTransform
        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            animationView.transform = CGAffineTransform.identity
        }, completion: nil)
        

        animationView.play()
    }
}

