//
//  RaceDetail.swift
//  FitwellTest
//
//  Created by Erencan Evren on 7.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import Foundation

struct RaceDetail: Codable {
    var userNameSurname: String?
    var location: String?
    var totalTime: String?
    var totalKm: String?
    var totalCal: String?
    var route: [Route]?
  
}

struct Route: Codable {
    var vehicle: Int?
    var hour: String?
    var description: String?
}
