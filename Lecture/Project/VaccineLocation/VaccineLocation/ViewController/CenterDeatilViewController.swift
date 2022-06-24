//
//  CenterDeatilViewController.swift
//  VaccineLocation
//
//  Created by HelloDigital_iOS_Dev on 2022/06/24.
//
import UIKit


class CenterDeatilViewController: UIViewController {
    var centerDetail: CenterDetailVO?
    
    
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let detail = centerDetail else { return }
        
        centerLabel.text = detail.centerName
        buildingLabel.text = detail.facilityName
        numberLabel.text = detail.phoneNumber
        dateLabel.text = detail.createdAt
        addressLabel.text = detail.address

    }
    
    
}
