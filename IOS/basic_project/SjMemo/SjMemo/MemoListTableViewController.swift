//
//  MemoListTableViewController.swift
//  SjMemo
//
//  Created by 김소진 on 2020/11/23.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    
    let formatter: DateFormatter = { //원하는 포맷으로 날짜 출력하기위해 설정
        let f = DateFormatter()
        f.dateStyle = .long //날짜 설정
        f.timeStyle = .short //시간 설정
        f.locale = Locale(identifier: "Ko_kr") //날짜와 시간 한글로 설정
        return f
    } ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) //이름 처럼 뷰컨트롤러가 관리하는 뷰가 화면에 표시되기 직전에 자동으로 호출
        
        //테이블 뷰에게 목록을 업데이트
//        tableView.reloadData() //최신 데이터로 업데이트
//        print(#function)    //제대로 들어갔는지 확인하는 로그
    }
    
    var token: NSObjectProtocol? //토큰을 저장할 속성 addObserver에서 리턴하는 토큰을 여기에 저장
    
    //소멸자에서 해제
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let vc = segue.destination as? DetailViewController {
                vc.memo = Memo.dummyMemoList[indexPath.row]
            }
        }
    }
    

    override func viewDidLoad() { //주로 한번만 실행되는 초기화 코드를 여기에 구현한다.
        super.viewDidLoad()

        
        //ViewDidLoad에서 선언한 Observer은 뷰가 화면에서 사라지기 전에 해제하거나 소멸자에서 해제합니다.
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDodInsert, object: nil, queue: OperationQueue.main) {
            [weak self] (noti) in
            self?.tableView.reloadData() //테이블뷰 reload
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let target = Memo.dummyMemoList[indexPath.row]
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
