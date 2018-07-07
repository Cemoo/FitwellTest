//
//  RaceListViewModel.swift
//  FitwellTest
//
//  Created by Erencan Evren on 7.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class RaceListViewModel {
    var races = [Race]()
    func getRaces() {
        if let path = Bundle.main.path(forResource: "races", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.races = try! JSONDecoder().decode([Race].self, from: data)
            } catch {
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
