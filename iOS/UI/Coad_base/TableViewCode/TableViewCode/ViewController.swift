//
//  ViewController.swift
//  TableViewCode
//
//  Created by 김소진 on 2022/11/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table View 생성
    // let tableView: UITableView = UITableView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - imageView
    private let img: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "cat")
    }()
    
    // MARK: - label
    private let label: UILabel = {
        let label = UILabel()
        label.text = "고먐미"
        label.textColor = UIColor.darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CodeCustomCell.self, forCellReuseIdentifier: "CodeCustomCell")
        
    }
    
    private func setConstraint() {
        contentView.addSubview(img)
        contentView.addSubview(label)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
            img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
            img.bottomAnchor.
            
            
        ])
    }

}

extension TableViewController: UITableViewDelegate {
    
}

