//
//  ViewController.swift
//  PageControl
//
//  Created by 김소진 on 2021/12/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // for문으로 받을 수 없을까?
    var images = ["flower_01.png","flower_02.png","flower_03.png",
                  "flower_04.png","flower_05.png","flower_06.png",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // 첫번째 페이지 currentPage = 현재페이지
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
        
    }
    
}

