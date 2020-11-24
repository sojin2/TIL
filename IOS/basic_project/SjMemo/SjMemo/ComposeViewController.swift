//
//  ComposeViewController.swift
//  SjMemo
//
//  Created by 김소진 on 2020/11/23.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo? //보기 화면에서 편집버튼을 누르면 전달한 메모가 이 속성에서 저장
    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet var memoTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        
        guard let memo = memoTextView.text,
              memo.count > 0 else {
             // 경고창 표시
            alert(message: "메모를 입력하세요")
            return
        }
        
//        let newMemo = Memo(content: memo) //새로운 메모 인스턴스 생성
//        Memo.dummyMemoList.append(newMemo) // 배열에 저장
        
        
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
   
        } else {
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDodInsert, object: nil)
        
            
            //이 코드는 라디오 방송국에서 라디오 방송을 브로드케스팅하는 것과 같다 NotificationCenter은 특정 객체에게 바로 전달되지 않는다.
            // 앱을 구성하는 모든 객체로 전달된다 (=브로드케스트)
        }
        
        
        
        
        dismiss(animated: true, completion: nil) //새 메모 화면을 닫음
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let memo = editTarget {
            navigationItem.title = "메모 편집"
            memoTextView.text = memo.content
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
        
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



extension ComposeViewController {
    //Notification = 라디오 방송이라 생각하면 됨 이름으로 구분
    static let newMemoDodInsert = Notification.Name(rawValue:"newMemoDidIn") //Notification 이름 선언
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
}
