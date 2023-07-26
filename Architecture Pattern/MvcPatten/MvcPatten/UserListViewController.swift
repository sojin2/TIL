//
//  UserListViewController.swift
//  MvcPatten
//
//  Created by 김소진 on 2022/02/01.
//

import UIKit
class UserListViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!


    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    let users: [User] = [
        User(name: "sojin", age: 25),
        User(name: "dohee", age: 27),
        User(name: "jimin", age: 23)
    ]

    
    @IBAction func clickButton(_ sender: UIButton) {

        nameLabel.text = users[num].name
        ageLabel.text = "(\(users[num].age))"
        
        num += 1
        
        if num == users.count {
            num = 0
        }
        
    }
}


