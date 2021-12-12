//
//  ViewController.swift
//  Quiz_PageControl
//
//  Created by 김소진 on 2021/12/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let numPages = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = numPages
        pageControl.currentPage = 0 // 첫번째 페이지 currentPage = 현재페이지
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        lbNumber.text = String(pageControl.currentPage + 1)
        lbColor()
        
    }
    
    @IBAction func numChange(_ sender: UIPageControl) {
        lbNumber.text = String(pageControl.currentPage + 1)
        lbColor()
    }
    
    func lbColor() {
        if Int(lbNumber.text!)! % 2 == 0 {
            lbNumber.textColor = UIColor.blue
        } else {
            lbNumber.textColor = UIColor.red
        }
    }
    

    

}

