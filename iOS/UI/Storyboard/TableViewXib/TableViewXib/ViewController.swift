//
//  ViewController.swift
//  TableViewXib
//
//  Created by 김소진 on 2022/11/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         registerXib()
    }

    private func registerXib() {

        let nibName = UINib(nibName: "CustomCell", bundle: nil)

        tableView.register(nibName, forCellReuseIdentifier: "CustomCell")

    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        return cell
    }
}

