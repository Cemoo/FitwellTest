//
//  RouteCell.swift
//  FitwellTest
//
//  Created by Erencan Evren on 7.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class RouteCell: UITableViewCell {

    @IBOutlet weak var lblVehcleName: UILabel!
    @IBOutlet weak var lblHour: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgVehicle: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
