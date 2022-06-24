//
//  CenterListViewController.swift
//  VaccineLocation
//
//  Created by HelloDigital_iOS_Dev on 2022/06/23.
//

import UIKit
import Moya

class CenterListViewController: UITableViewController {
    let viewModel = VaccineViewModel()
    var centerList: [CenterVO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.requestPointSaveList()
        
        let nibName = UINib(nibName: "LocationListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "LocationListCell")
    }
}

extension CenterListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return centerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationListCell", for: indexPath) as? LocationListCell else { return UITableViewCell() }
        
        cell.centerLabel.text = "\(centerList[indexPath.row].data.centerName)"
        cell.buildingLabel.text = "\(centerList[indexPath.row].data.facilityName)"
        cell.addressLabel.text = "\(centerList[indexPath.row].data.address)"
        cell.DateLabel.text = "\(centerList[indexPath.row].data.createdAt)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //상세화면 전달
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CenterDeatilViewController") as? CenterDeatilViewController else { return }
        
        detailViewController.centerDetail = centerList[indexPath.row].data
        self.show(detailViewController, sender: nil)
    
    }
}
