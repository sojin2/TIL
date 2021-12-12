//
//  SiteRequest.swift
//  WebTabBar
//
//  Created by 김소진 on 2021/12/12.
//

import WebKit

class SiteRequest {
    
    func loadWebPage(url: String) -> URLRequest {
        let myUrl = URL(string: url)
        return URLRequest(url: myUrl!)
    }
    
    
}

