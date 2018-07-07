//
//  RaceDetailViewModel.swift
//  FitwellTest
//
//  Created by Erencan Evren on 7.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import Foundation

class RaceDetailViewModel {
    
    var race = RaceDetail()
    func getRaceDetail() {
        if let path = Bundle.main.path(forResource: "raceDetail", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.race = try! JSONDecoder().decode(RaceDetail.self, from: data)
            } catch {
            }
        }
    }
    
    func fill(_ cell: RouteCell, row: Int) -> RouteCell  {
        guard let routes = race.route else {
            return RouteCell()
        }
        
        cell.lblDescription.text = routes[row].description ?? ""
        cell.lblHour.text =  routes[row].hour ?? ""
        switch routes[row].vehicle ?? nil {
        case 1:
            cell.imgVehicle.image = #imageLiteral(resourceName: "subway")
            cell.lblVehcleName.text = "Train"
        case 2:
            cell.imgVehicle.image = #imageLiteral(resourceName: "airplane-1")
            cell.lblVehcleName.text = "Airplane"
        case 3:
            cell.imgVehicle.image = #imageLiteral(resourceName: "bus-1")
            cell.lblVehcleName.text = "Bus"
        default:
            break
        }
        
        return cell
    }
}

enum VehicleType: Int {
    case train = 1
    case airplane = 2
    case bus = 3
}
