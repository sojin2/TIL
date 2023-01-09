//
//  ViewController.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/03.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Phone {succeed, failed in
        }
        
        func Phone(completion: @escaping (_ succeed: PhoneModel?, _ failed: Error?) -> Void) {
            API.session.request(APIBase.getPhone)
                .responseDecodable { (response: AFDataResponse<PhoneModel>) in
                    switch response.result {
                    case .success(let response):
                        print("성공임 ㅎㅅㅎ")
                        print(response)
                        completion(response, nil)
                    case .failure(let error):
                        print("실패임 ㅜ.ㅜ")
                        print(error)
                        completion(nil, error)
                    }
                }
        }
    }
    
}

