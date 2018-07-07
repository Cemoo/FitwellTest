//
//  RaceCell.swift
//  FitwellTest
//
//  Created by Erencan Evren on 7.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class RaceCell: UITableViewCell {

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var lblRacePlaceName: UILabel!
    @IBOutlet weak var btnPersonCount: UIButton!
    @IBOutlet weak var btnKm: UIButton!
    @IBOutlet weak var btnTime: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    
    private func setupUI() {
        self.selectionStyle = .none
        self.imgUser.layer.borderColor = UIColor.white.cgColor
        self.imgUser.layer.borderWidth = 1
        
        self.imgUser.layer.cornerRadius = self.imgUser.frame.height / 2
    }

}
