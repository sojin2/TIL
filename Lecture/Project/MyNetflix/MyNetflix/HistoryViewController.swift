//
//  HistoryViewController.swift
//  MyNetflix
//
//  Created by HelloDigital_iOS_Dev on 2022/06/10.
//  Copyright © 2022 com.joonwon. All rights reserved.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var searchTerms: [SearchTerm] = []
    
    let db = Database.database().reference().child("searchHistory")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        db.observeSingleEvent(of: .value) { (snapshot) in
            
            guard let searchHistory = snapshot.value as? [String: Any] else { return }
            let data = try! JSONSerialization.data(withJSONObject: Array(searchHistory.values), options: [])
            
            let decoder = JSONDecoder()
            let searchTerms = decoder.decode([searchTerms].self, from: data)
            
            print("---> snapshot: \(data)")
        }
    }
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryCell else {
            return UITableViewCell()
        }
        cell.searchTerm.text = searchTerms[indexPath.row].term
        return cell
    }
    
     
}

class HistoryCell: UITableViewCell {
    @IBOutlet weak var searchTerm: UILabel!
}

struct SearchTerm: Codable {
    let term: String
    let timestamp: TimeInterval
}
