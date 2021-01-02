//
//  ViewController.swift
//  WebWorkFlowy
//
//  Created by 김소진 on 2021/01/02.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let filePath = Bundle.main.path(forResource: "htmlWF", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
 
        
    }
    
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
        
    }

    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    
}

