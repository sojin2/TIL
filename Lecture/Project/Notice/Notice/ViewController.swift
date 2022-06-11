//
//  ViewController.swift
//  Notice
//
//  Created by HelloDigital_iOS_Dev on 2022/06/09.
//

import UIKit
import FirebaseRemoteConfig

class ViewController: UIViewController {
    
    var remoteConfig: RemoteConfig?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remoteConfig 객체 선언
        remoteConfig = RemoteConfig.remoteConfig()
        
        let setting = RemoteConfigSettings()
        // 최소한 자주 원격 구성에있는 데이터들을 가져오기 위한 설정
        setting.minimumFetchInterval = 0
        
        remoteConfig?.configSettings = setting
        remoteConfig?.setDefaults(fromPlist: "RemoteConfig")
    }
}

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
        }
    }
    
    func isNoticHidden(_ remoteConfig: RemoteConfig) -> Bool {
        return remoteConfig["isHidden"].boolValue
    }
}

