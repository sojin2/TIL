//
//  DViewController.swift
//  WebTabBar
//
//  Created by 김소진 on 2021/12/12.
//

import UIKit
import WebKit

class DViewController: ViewController {

    
    @IBOutlet weak var dWebView: WKWebView!
    @IBOutlet weak var dActivityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        dWebView.navigationDelegate = self
        
        
        // class의 함수를 이용한 Web 구성
        let site: SiteRequest = SiteRequest()
        let myRequest = site.loadWebPage(url: "https://www.daum.net")
        dWebView.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension DViewController: WKNavigationDelegate {
    // Indicator 시작
    func WebView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        dActivityIndicator.startAnimating()
        dActivityIndicator.isHidden = false
    }
    // Indicator 종류
    func WebView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        dActivityIndicator.stopAnimating()
        dActivityIndicator.isHidden = true
    }
    // Error 발행시
    func WebView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        dActivityIndicator.stopAnimating()
        dActivityIndicator.isHidden = true
    }
}


