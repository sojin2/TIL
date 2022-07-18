//
//  ViewController.swift
//  UrlsessionAPI
//
//  Created by 김소진 on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var adviceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData()
 
        
    }
    
    @IBAction func adviceButton(_ sender: Any) {
        fetchData()
    }
    
    func fetchData() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let urlString = "https://api.adviceslip.com/advice"
        let url = URL(string: urlString)
        
        var requestURL = URLRequest(url: url!)
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            guard error == nil else { return }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
            let successRange = 200..<300
            
            guard successRange.contains(statusCode) else {
                //handle response error
                return
            }
                            
            if let safeData = data {
                do {
                    let result = try JSONDecoder().decode(Advice.self, from: safeData)
                    print(result)
                    DispatchQueue.main.async {
                        self.adviceLabel.text = result.slip.advice
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        
        dataTask.resume()
    }

}

struct Advice: Decodable {
    var slip: Slip

    struct Slip: Decodable {
        var id: Int
        var advice: String
    }
}
