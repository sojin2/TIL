//
//  ViewController.swift
//  MulPickerView
//
//  Created by 김소진 on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerMul: UIPickerView!
    @IBOutlet weak var lbText: UILabel!
    @IBOutlet weak var mulResult: UITextView!
    
    
    
    //    var dan:[Int] = [2,3,4,5,6,7,8,9]
    // 연속된 숫자 배열 선언 방법
    var dan = [Int](2...9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lbText.text = "\(dan[0])단"
        mul(dan: dan[0])
        
        pickerMul.dataSource = self
        pickerMul.delegate = self
    }

    
    func mul(dan: Int) {
        mulResult.text = ""
        for i in 1...9 {
            mulResult.text += "\(dan) * \(i) = \(dan * i) \n" //누적
        }
    }
    
}

extension ViewController: UIPickerViewDataSource {
    //pickerView 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // PickerView row 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dan.count
    }

}

extension ViewController: UIPickerViewDelegate {
    // Title 정의
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(dan[row])단"
    }
    
    //pickerview에서 선택한 경우
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lbText.text = "\(dan[row])단"
        mul(dan: row + 2) // 베열 0부터 시작하므로
    }
}
