//
//  ViewController.swift
//  ImageSwipeGesture
//
//  Created by 김소진 on 2021/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["flower_01.jpg","flower_02.jpg","flower_03.jpg","flower_04.jpg","flower_05.jpg","flower_06.jpg"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // pagecontrol
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // 첫번째 페이지 currentPage = 현재페이지
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        // 초기 화면
        imgView.image = UIImage(named: images[pageControl.currentPage])
        
        makeSwipeAction()
        
    }


    
    func makeSwipeAction() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        
            
            switch swipeGesture.direction {

            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage -= 1
                // imgView.image = UIImage(named: images[pageControl.currentPage - 1])
                
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage += 1
                //imgView.image = UIImage(named: images[pageControl.currentPage + 1])
                
            default:
                break
            }
            
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
        
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) { // 맨 밑에 두어야 밑에 색도 같이 움직인다!!
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    
}

