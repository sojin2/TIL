//
//  ViewController.swift
//  Notice
//
//  Created by HelloDigital_iOS_Dev on 2022/06/09.
//

import UIKit
import FirebaseRemoteConfig
import FirebaseAnalytics

class ViewController: UIViewController {
    
    var remoteConfig: RemoteConfig?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remoteConfig 객체 선언
        remoteConfig = RemoteConfig.remoteConfig()
        
        let setting = RemoteConfigSettings()
        // 최소한 자주 원격 구성에있는 데이터들을 가져오기 위한 설정
        setting.minimumFetchInterval = 0
        
        // setting값을 remoteConfig Setting 값으로 설정
        remoteConfig?.configSettings = setting
        
        // 만든 plist를 인식할 수 있도록 연결하기
        remoteConfig?.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNotice() 
    }
    
}

// firebase 콘솔에서 설정한 값들을 가져오기
// RemoteConfig
extension ViewController {
    
    func getNotice() {
        guard let remoteConfig = remoteConfig else { return }
        
        remoteConfig.fetch() {[weak self] status, _ in
            if status == .success {
                remoteConfig.activate(completion: nil)
            } else {
                print("ERROR: Config out fetched")
            }
            
            guard let self = self else { return }
            
            // 공지 사항이 보여질때
            if !self.isNoticHidden(remoteConfig) {
                let noticeVC = NoticeViewController(nibName: "NoticeViewController", bundle: nil)
                
                noticeVC.modalPresentationStyle = .custom
                noticeVC.modalTransitionStyle = .crossDissolve
                
                // replacingOccurrences : \n이 패치 과정에서 \\n으로 넘어가는 오류가 발생하는데, 원하는 형식의 줄 바꿈(\n)으로 변환함
                let title = (remoteConfig["title"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                let detail = (remoteConfig["detail"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                let date = (remoteConfig["date"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
            
                noticeVC.noticeContents = (title: title, detail: detail, date: date)
                self.present(noticeVC, animated: true, completion: nil )
            } else {
                self.showEventAlert()
            }
        }
    }
    
    // 공지사항을 숨기는 함수 - NoticeViewController를 보여줄지 말지 (isHidden)
    func isNoticHidden(_ remoteConfig: RemoteConfig) -> Bool {
        return remoteConfig["isHidden"].boolValue
    }
}

// A/B Testing
extension ViewController {
    func showEventAlert() {
        guard let remoteConfig = remoteConfig else { return }
        
        remoteConfig.fetch {[weak self] status, _ in
            if status == .success {
                remoteConfig.activate(completion: nil)
            } else {
                print("Config not fetched")
            }
            
            let message = remoteConfig["message"].stringValue ?? ""
            
            
            let confirmAction = UIAlertAction(title: "확인하기", style: .default) { action in
                Analytics.logEvent("promotion_alert", parameters: nil)
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            let alertController = UIAlertController(title: "깜짝 이벤트", message: message, preferredStyle: .alert)
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            self?.present(alertController, animated: true, completion: nil)
        }
    }
}
