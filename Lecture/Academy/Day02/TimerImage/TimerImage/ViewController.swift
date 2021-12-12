//
//  ViewController.swift
//  Quiz08
//
//  Created by 김소진 on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgTitle1: UILabel!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgTitle2: UILabel!
    @IBOutlet weak var imgView2: UIImageView!
    
    
    var imageName: [String] = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    var numimageUp = 0
    var numimageDown = 0
    
    let interval = 1.0
    var count = 0
    
    let timeSelector: Selector = #selector(ViewController.updateImage)
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        imgTitle1.text = imageName[numimageUp]
        imgView1.image = UIImage(named: imageName[numimageUp])
        
        imgTitle2.text = imageName[numimageDown]
        imgView2.image = UIImage(named: imageName[numimageDown])
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)

      }
    
    
    @objc func updateImage() {
        upImageTitle()
        downImageTitle()
        
    }
    
    func upImageTitle() {
        numimageUp += 1
        
        if numimageUp >= imageName.count {
            numimageUp = 0
        }
        
        imgTitle1.text = imageName[numimageUp]
        imgView1.image = UIImage(named: imageName[numimageUp])
    }
    
    func downImageTitle() {
        count += 1
        
        if count % 3 == 0 {
            numimageDown += 1
            
            if numimageDown >= imageName.count {
                numimageDown = 0
            }
            
            imgTitle2.text = imageName[numimageDown]
            imgView2.image = UIImage(named: imageName[numimageDown])
            
        }
        
    }
}
