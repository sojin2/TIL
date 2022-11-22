//
//  ViewController.swift
//  TableViewCode
//
//  Created by 김소진 on 2022/11/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configure()
        addViews()
        setConstraint()
        
    }
    
    func configure() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
    
    func addViews() {
        view.addSubview(tableView)
    }
    
    private func setConstraint() {
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        return cell
    }
}

