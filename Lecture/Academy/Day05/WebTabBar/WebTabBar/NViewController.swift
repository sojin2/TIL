//
//  NViewController.swift
//  WebTabBar
//
//  Created by 김소진 on 2021/12/12.
//

import UIKit
import WebKit

class NViewController: ViewController {
    
    @IBOutlet weak var nWebView: WKWebView!
    @IBOutlet weak var nActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nWebView.navigationDelegate = self
        
        let site: SiteRequest = SiteRequest()
        let myRequest = site.loadWebPage(url: "https://www.naver.com")
        nWebView.load(myRequest)
        
        
    }


}

extension NViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        nActivityIndicator.startAnimating()
        nActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        nActivityIndicator.stopAnimating()
        nActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        nActivityIndicator.stopAnimating()
        nActivityIndicator.isHidden = true
    }
    
}
