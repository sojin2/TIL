//
//  CatTableViewCell.swift
//  TableViewXib
//
//  Created by 김소진 on 2022/11/22.
//

import UIKit

class CustomCell: UITableViewCell {


    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
