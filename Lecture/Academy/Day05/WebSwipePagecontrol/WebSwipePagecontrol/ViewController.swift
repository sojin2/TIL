//
//  ViewController.swift
//  WebSwipePagecontrol
//
//  Created by 김소진 on 2021/12/12.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    var sites = ["www.daum.net","www.google.com","www.naver.com"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = sites.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        loadWebPage(url: sites[pageControl.currentPage]) // 처음 화면 로드 (단 한번만 실행되는 부분임니다)
        
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
            
            loadWebPage(url: sites[pageControl.currentPage])
        
        }
    }
    
    

    func loadWebPage(url: String) {
       let siteContents = "http://" + url
        let myUrl = URL(string: siteContents)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
        
        
        
    @IBAction func pageChange(_ sender: UIPageControl) {

        loadWebPage(url: sites[pageControl.currentPage]) //바뀔때 다시 페이지를 로드해줘야됨
    }

}

extension ViewController:WKNavigationDelegate {
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    // Indicator 종류
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    // Error 발행시
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
}

