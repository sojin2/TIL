//
//  MoneyOutputViewController.swift
//  Mession
//
//  Created by 김소진 on 2021/10/18.
//

import UIKit

class MoneyOutputViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var numberOfTime: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timeLabel.text = "\(numberOfTime)시간 \n 일했다면..."
        moneyLabel.text = "총 \(calculateMoney())₩ 입니다."
    }
    
    func calculateMoney() -> String {
        // 규칙
        var moneymult = Int(numberOfTime) * 8720
        var result = DecimalWon(value: moneymult)
        
        return result
    }

    func DecimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
            
            return result
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
