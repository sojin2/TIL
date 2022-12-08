//
//  LocationListCell.swift
//  VaccineLocation
//
//  Created by HelloDigital_iOS_Dev on 2022/06/24.
//

import UIKit

class LocationListCell: UITableViewCell {

    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
    var locationViewModel = VaccineViewModel()
    var vo: CenterVO.CenterDetailVO?
    
    
    func reset(){
        centerLabel.text = ""
        buildingLabel.text = ""
        addressLabel.text = ""
        DateLabel.text = ""
    }
    
    func setData(vo: CenterVO.CenterDetailVO?, tranxType: String?){
        reset()
        self.vo = vo
        guard let model = vo else {
            return
        }
        
        // 이름
        centerLabel.text = model.centerName
        buildingLabel.text = model.facilityName
        addressLabel.text = model.address
        DateLabel.text = model.createdAt
        
    }
    
}
