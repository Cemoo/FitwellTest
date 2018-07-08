//
//  RaceDetailVC.swift
//  FitwellTest
//
//  Created by Erencan Evren on 6.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

let raceDetail = RaceDetailViewModel()
class RaceDetailVC: UIViewController {
    
    @IBOutlet weak var imgMap: UIImageView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    
    @IBOutlet weak var lblTotalTime: UILabel!
    @IBOutlet weak var lblTotalKm: UILabel!
    @IBOutlet weak var lblTotlalCal: UILabel!
    
    @IBOutlet weak var tbRoute: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        raceDetail.get()
        fillStaticDatas()
        tbRoute.reloadData()
    }
    
    private func setupTableView() {
        tbRoute.delegate = self
        tbRoute.dataSource = self
        
        tbRoute.rowHeight = UITableViewAutomaticDimension
        tbRoute.estimatedRowHeight = 120
        
        let nib = UINib(nibName: "RouteCell", bundle: nil)
        tbRoute.register(nib, forCellReuseIdentifier: "cell")
        
        tbRoute.tableFooterView = UIView()
        tbRoute.separatorStyle = .none
        
    }
    
    func fillStaticDatas() {
        let detail = raceDetail.race
        self.lblUsername.text = detail.userNameSurname ?? ""
        self.lblArea.text = detail.location ?? ""
        self.lblTotalKm.text = detail.totalKm ?? ""
        self.lblTotalTime.text = detail.totalTime ?? ""
        self.lblTotlalCal.text = detail.totalCal ?? ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RaceDetailVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let routes = raceDetail.race.route else {
            return 0
        }
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbRoute.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RouteCell
        return raceDetail.fill(cell, row: indexPath.row)
    }
    
    
}


