//
//  Phrase
//  MoyaAPI
//
//  Created by HelloDigital_iOS_Dev on 2022/05/02.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    @IBOutlet weak var adviceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func nextButton(_ sender: Any) {
        let provider = MoyaProvider<AdviceAPI>()
        provider.request(.randomAdvice) { (result) in
            switch result {
            case let .success(response):
                let result = try? response.map(Advice.self)
                print(result)
                self.adviceLabel.text = result?.slip.advice
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}

