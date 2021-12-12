//
//  ViewController.swift
//  Quiz08
//
//  Created by 김소진 on 2021/12/05.
//

import UIKit

class ButtonViewController: UIViewController {
    
    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!

    var count = 0
    
    var imageName: [String] = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]

      override func viewDidLoad() {
        super.viewDidLoad()
        imgTitle.text = imageName[0]
        imgView.image = UIImage(named: imageName[0])
        
        
      }
    
    func imgUp() {
        count += 1
        imgView.image = UIImage(named: imageName[count])
    }
    
    func imgDown() {
        count -= 1
        imgView.image = UIImage(named: imageName[count])
        
    }
    
    @IBAction func backClickBtn(_ sender: UIButton) {
        imgDown()
    }
    
    @IBAction func GoClickbtn(_ sender: UIButton) {
        imgUp()
    }
}
