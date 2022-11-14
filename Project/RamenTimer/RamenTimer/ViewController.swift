//
//  ViewController.swift
//  RamenTimer
//
//  Created by 김소진 on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var secondsLeft: Int = 180
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerButton.layer.cornerRadius = 10
        
        self.updateTimeLeft()
        
    }
    
    func resetTimer() {
        timer?.invalidate() // 지금 돌아가는 타이머를 꺼주세요
        timer = nil
        timerButton.setTitle("타이머 시작하기", for: .normal)
    }
    
    func updateTimerLabel() {
        var minutes = self.secondsLeft / 60
        var seconds = self.secondsLeft % 60
        
        if self.secondsLeft < 10 {
            self.timerLabel.textColor = UIColor.red
        }else {
            self.timerLabel.textColor = UIColor.black
        }
        
        
        UIView.transition(with: self.timerLabel, duration: 0.3, options: .transitionFlipFromBottom) {
            if self.secondsLeft > 0 {
                self.timerLabel.text = String(format:"%02d:%02d", minutes, seconds)
            } else {
                self.timerLabel.text = "시간 끝"
            }
        } completion: {(animated) in
        }
    }
    
    func updateTimeLeft() {
        self.secondsLeft = 180 + segment.selectedSegmentIndex * 60
        self.updateTimerLabel()
    }
    
    @IBAction func segmentValueChange(_ sender: Any) {
        self.resetTimer()
        self.updateTimeLeft()
    }
    
    
    @IBAction func timerButtonClicked(_ sender: Any) {
        
        if timer != nil {
            resetTimer()
            return
        }
        
        self.timerButton.setTitle("타이머 종료하기", for: .normal)
        self.updateTimeLeft()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
            self.secondsLeft -= 1
            self.updateTimerLabel()
            
            if self.secondsLeft == 0 {
                self.resetTimer()
            }
        }
       
    }

}

