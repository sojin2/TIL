//
//  ViewController.swift
//  Quiz11
//
//  Created by 김소진 on 2021/12/11.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerWeb: UIPickerView!
    @IBOutlet weak var urlWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    var sites: [String] = ["www.naver.com","www.daum.net","www.google.com","www.nate.com","www.cnn.com",
                         "www.cbs.com"]
    var sitetitle: [String] = ["네이버","다음","구글","네이트","CNN",
                         "CBS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerWeb.dataSource = self
        pickerWeb.delegate = self //델리게이트
        urlWebView.navigationDelegate = self
        
        loadWebPage(url: sites[0])
    }

    func loadWebPage(url: String) {
       let siteContents = "http://" + url
        let myUrl = URL(string: siteContents)
        let myRequest = URLRequest(url: myUrl!)
        urlWebView.load(myRequest)
    }
}

extension ViewController: UIPickerViewDataSource{
    //pickerView 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int ) -> Int {
        return sites.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(sitetitle[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //web page
        loadWebPage(url: sites[row])
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
