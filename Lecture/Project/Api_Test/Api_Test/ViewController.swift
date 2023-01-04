//
//  ViewController.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/03.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getTest() {
        let url = "https://www.odigo.ai/v2/api/accounts/phone/01082592164"
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        let request = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate(statusCode: 200..<500)
            .responseDecodable(completionHandler: <#T##(DataResponse<Decodable, AFError>) -> Void#>)


}

