//
//  ViewController.swift
//  Quiz10
//
//  Created by 김소진 on 2021/12/05.
//

import UIKit

class PickerViewController: UIViewController {

    @IBOutlet weak var lblCurrent: UILabel!
    @IBOutlet weak var lblSelect: UILabel!
    
    let timeSelector: Selector = #selector(PickerViewController.updateTime)
    let interval = 1.0  // 기준값
    var alarmTime: String?
    var alerFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
       }
    
       //사용자가 선택한 시간에 대한 코드
      @IBAction func tableDatePicker(_ sender: UIDatePicker) {
           let datePickerView = sender
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"  //화면에 띄우는 것
          lblSelect.text = "선택시간 : " + formatter.string(from: datePickerView.date) //화면에 띄우는 것
         
          formatter.dateFormat = "a hh:mm"
          alarmTime = formatter.string(from: datePickerView.date)
          
           
       }
    
      @objc func updateTime(){
           //현재시간은 계속 움직이고 있다.
           let date = NSDate()
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
          lblCurrent.text = "현재시간 : " + formatter.string(from: date as Date)
        
          
          formatter.dateFormat = "a hh:mm"
          let currentTime = formatter.string(from: date as Date)
          
          if alarmTime == currentTime {
              if !alerFlag{
                  let okAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!!!", preferredStyle: .alert)
                  let actionOk = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
                  
                  okAlert.addAction(actionOk)
                  present(okAlert, animated: true, completion: nil)
                  alerFlag = true
              } else {
                  alerFlag = false
              }
          }
          
       }
}
    


