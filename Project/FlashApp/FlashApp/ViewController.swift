//
//  ViewController.swift
//  FlashApp
//
//  Created by 소진 on 2021/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var onbutton: UIButton!
    @IBOutlet weak var offbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButton(_ sender: UIButton) {
        view.backgroundColor = UIColor(red: 0.41, green: 0.73, blue: 0.93, alpha: 1.00)
        label.textColor = UIColor.black
        imageView.image = UIImage(systemName: "sun.max.fill")
        onbutton.setTitleColor(.black, for: .normal)
        offbutton.setTitleColor(.black, for: .normal)
    }
    

    @IBAction func offButton(_ sender: UIButton) {
        view.backgroundColor = UIColor(red: 0.00, green: 0.06, blue: 0.39, alpha: 1.00)
        label.textColor = UIColor.white
        imageView.image = UIImage(systemName: "moon.stars.fill")
        onbutton.setTitleColor(.white, for: .normal)
        offbutton.setTitleColor(.white, for: .normal)
    }

}


