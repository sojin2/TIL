//
//  ViewController.swift
//  PopupView
//
//  Created by 김소진 on 2023/07/18.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    private let button = UIButton().then {
    $0.setTitleColor(.systemBlue, for: .normal)
    $0.setTitleColor(.blue, for: .normal)
    $0.setTitle("팝업 띄우기", for: .normal)
    }
    
    private let button2 = UIButton().then {
      $0.setTitleColor(.systemBlue, for: .normal)
      $0.setTitleColor(.blue, for: .normal)
      $0.setTitle("팝업2 띄우기", for: .normal)
    }
    
    private let button3 = UIButton().then {
      $0.setTitleColor(.systemBlue, for: .normal)
      $0.setTitleColor(.blue, for: .normal)
      $0.setTitle("팝업3 띄우기", for: .normal)
    }
    
    private let button4 = UIButton().then {
      $0.setTitleColor(.systemBlue, for: .normal)
      $0.setTitleColor(.blue, for: .normal)
      $0.setTitle("팝업4 띄우기", for: .normal)
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    
      view.addSubview(button)
      view.addSubview(button2)
      view.addSubview(button3)
      view.addSubview(button4)
      
      self.button.snp.makeConstraints {
          $0.top.equalTo(self.view.safeAreaLayoutGuide)
          $0.centerX.equalToSuperview()
      }
      
      self.button2.snp.makeConstraints {
          $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
          $0.centerX.equalToSuperview()
      }
      
      self.button3.snp.makeConstraints {
          $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
          $0.centerX.equalToSuperview()
      }
      
      self.button4.snp.makeConstraints {
          $0.top.equalTo(view.safeAreaLayoutGuide).inset(150)
          $0.centerX.equalToSuperview()
      }
      
      self.button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
      self.button2.addTarget(self, action: #selector(self.didTapButton2), for: .touchUpInside)
      self.button3.addTarget(self, action: #selector(self.didTapButton3), for: .touchUpInside)
      self.button4.addTarget(self, action: #selector(self.didTapButton4), for: .touchUpInside)

  }

    
    @objc private func didTapButton() {
        let popupViewController = PopupViewController(TwoBnt: false, title: "태그 등록", sub: "자산에 태그를 등록하시겠습니까?", leftTitle: "취소", rightTitle: "확인")
      popupViewController.modalPresentationStyle = .overFullScreen
      self.present(popupViewController, animated: false)
    }
    
    @objc private func didTapButton2() {
        let infoPopupViewController = InfoPopupViewController(TwoBnt: false, image: "cat", title: "근로자 확인", name: "김소진", number: "01082592164", leftTitle: "취소", rightTitle: "확인")
        infoPopupViewController.modalPresentationStyle = .overFullScreen
      present(infoPopupViewController, animated: false)
    }
    
    @objc private func didTapButton3() {
        let info3PopupViewController = Info3PopupViewController(title: "입고 자산 확인",image: "cat", name: "전동드릴이여요", type: "전동드릴", standard: "18V")
        info3PopupViewController.modalPresentationStyle = .overFullScreen
      self.present(info3PopupViewController, animated: false)
    }

    @objc private func didTapButton4() {
        let info4PopupViewController = Info4PopupViewController(TwoBnt: true, image: "cat", title: "퇴근 확인하기", name: "김소진", number: "01082592164", time: "10:00", distance: "3", leftTitle: "취소", rightTitle: "승인")
        info4PopupViewController.modalPresentationStyle = .overFullScreen
      self.present(info4PopupViewController, animated: false)
    }
    
}
