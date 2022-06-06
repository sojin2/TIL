//
//  ViewController.swift
//  TabBar
//
//  Created by 김소진 on 2021/12/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnGoAlert(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1 //tabbar 활용
    }
    
    @IBAction func btnGoDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
}

