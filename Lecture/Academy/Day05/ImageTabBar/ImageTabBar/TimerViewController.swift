//
//  ViewController.swift
//  Quiz08
//
//  Created by 김소진 on 2021/12/05.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblImg: UILabel!

    var imageName: [String] = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    var numimageUp = 0
    var numimageDown = 0
    
    let interval = 1.0
    var count = 0
    
    let timeSelector: Selector = #selector(TimerViewController.updateImage)
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        lblImg.text = imageName[numimageUp]
        imgView.image = UIImage(named: imageName[numimageUp])
    
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)

      }
    
    
    @objc func updateImage() {
        ImageTitle()
        
    }
    
    func ImageTitle() {
        
        count += 1
        
        if count % 3 == 0 {
            numimageUp += 1
            
            if numimageUp >= imageName.count {
                numimageUp = 0
            }
            
            lblImg.text = imageName[numimageUp]
            imgView.image = UIImage(named: imageName[numimageUp])
            
        }
        
    }

//        numimageUp += 1
//
//        if numimageUp >= imageName.count {
//            numimageUp = 0
//        }
//
//        imgTitle1.text = imageName[numimageUp]
//        imgView1.image = UIImage(named: imageName[numimageUp])
    

}
