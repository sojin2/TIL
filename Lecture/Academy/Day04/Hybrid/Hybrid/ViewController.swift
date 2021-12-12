//
//  ViewController.swift
//  Hybrid
//
//  Created by 김소진 on 2021/12/11.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        
        
        // 첫 화면은 naver로 띄우자!
        loadWebPage(url: "https://www.naver.com")
    }

    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        
        myWebView.load(myRequest)
    }
    
    // Site1: https://www.google.com
    @IBAction func btnGoogle(_ sender: UIButton) {
        
        loadWebPage(url: "https://www.google.com")
    }
    
    
    // Site2: https://www.daum.net
    @IBAction func btnDaum(_ sender: UIButton) {
        loadWebPage(url: "https://www.daum.net")
    }
    
    @IBAction func btnGo(_ sender: Any) {
        let myUrl = checkUrl(tfUrl.text!)
        loadWebPage(url: myUrl)
        
        //loadWebPage(url: tfUrl.text!)
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://") || strUrl.hasPrefix("https://")
        
        if !flag {
            strUrl = "https:// + strUrl"
        }
        
        return strUrl
    }
    
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = """
        <html>
            <head>
                <meta charset="utf-8">
                <meta name = "viewport" content = "width = device - width, initial - scale = 1.0"
            </head>
            <body>
                <h1>HTML String</h1>
                <p>String 변수를 이용한 웹페이지</p>
                <p><a href ="http://jtbc.joins.com">JTBC</a>로 이동 </p>
            </body>
        </html>
        """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        // 최상위 파일을 Bundel 이라고 함
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequestt = URLRequest(url:  myUrl)
        myWebView.load(myRequestt)
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
