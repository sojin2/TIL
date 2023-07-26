//
//  ViewController.swift
//  TableViewTutorial
//
//  Created by 김소진 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - override Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - TableView Delegate Method
    // cell의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    // cell에 대한 설정 (내부 구성?)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        return cell
        
        }
}

