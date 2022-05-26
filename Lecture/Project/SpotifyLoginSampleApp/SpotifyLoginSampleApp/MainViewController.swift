//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by HelloDigital_iOS_Dev on 2022/05/26.
//

import UIKit

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
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        // 로그아웃시에 첫번째 화면으로 넘어감
        self.navigationController?.popViewController(animated: true)
        
    }
}
