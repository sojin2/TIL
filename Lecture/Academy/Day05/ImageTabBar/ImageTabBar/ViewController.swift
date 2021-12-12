//
//  ViewController.swift
//  ImageTabBar
//
//  Created by 김소진 on 2021/12/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGoButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1 //tabbar 활용
    }
    
    @IBAction func btnGoTimer(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2 //tabbar 활용
    }
    
    @IBAction func btnGoPageController(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3 //tabbar 활용
    }
    
}

