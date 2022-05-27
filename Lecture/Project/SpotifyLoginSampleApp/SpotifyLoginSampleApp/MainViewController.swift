//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by HelloDigital_iOS_Dev on 2022/05/26.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바가 보이거나 스와이프 제스쳐, 팝 제스쳐를 했을때 실제로 뒤로가게되면 UI가 어색해짐 그래서 false 처리
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        

        // 1. 현재 로그인한 사용자의 이메일 가져오기
        let email = Auth.auth().currentUser?.email ?? "User"

        // 2. 라벨에 이메일 뿌려주기
        welcomeLabel.text = """
        환영합니다.
        \(email)님
        """
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            // 로그아웃시에 첫번째 화면으로 넘어감
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
        
        
        
        
    }
}
