//
//  RaceListViewModel.swift
//  FitwellTest
//
//  Created by Erencan Evren on 7.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class RaceListViewModel: BaseViewModel {
    var races = [Race]()
    func getRaces() {
        self.getThem("races", Race()) { [unowned self] (response) in
            if let res = response {
                self.races = res
            }
        }
    }
    
    func fill(_ cell: RaceCell, row: Int) -> RaceCell {
        if races.count > 0 {
            cell.imgBackground.image =  UIImage(named: races[row].backgroundImage ?? "")
            cell.lblRacePlaceName.text = races[row].placeName ?? ""
            cell.btnKm.setTitle("\(races[row].km ?? "") KM"  , for: .normal)
            cell.btnPersonCount.setTitle(races[row].personCount ?? "", for: .normal)
            cell.btnTime.setTitle(races[row].time ?? "", for: .normal)
            return cell
        } else {
            return RaceCell()
        }
    }
}
