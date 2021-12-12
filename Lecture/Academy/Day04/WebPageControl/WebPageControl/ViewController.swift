//
//  ViewController.swift
//  WebPageControl
//
//  Created by 김소진 on 2021/12/11.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var lblUrl: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    var sites = ["www.daum.net","www.google.com","www.naver.com"]
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            pageControl.numberOfPages = sites.count
            pageControl.currentPage = 0
            pageControl.pageIndicatorTintColor = UIColor.green
            pageControl.currentPageIndicatorTintColor = UIColor.red
            
            lblUrl.text = sites[pageControl.currentPage]
            loadWebPage(url: sites[pageControl.currentPage]) // 처음 화면 로드 (단 한번만 실행되는 부분임니다)
            
    }
    
    func loadWebPage(url: String) {
       let siteContents = "http://" + url
        let myUrl = URL(string: siteContents)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }

    
    @IBAction func webChange(_ sender: UIPageControl) {
        lblUrl.text = sites[pageControl.currentPage]
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

