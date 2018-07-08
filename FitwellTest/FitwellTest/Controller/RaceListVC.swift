//
//  RaceListVC.swift
//  FitwellTest
//
//  Created by Erencan Evren on 6.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class RaceListVC: UIViewController {
    
    
    @IBOutlet weak var tbList: UITableView!
    let listViewModel = RaceListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updateUI()
        listViewModel.getRaces()
    }
    
    private func setupTableView() {
        tbList.delegate = self
        tbList.dataSource = self
        tbList.separatorStyle = .none
    }
    
    private func updateUI() {
        let button = UIBarButtonItem(image: UIImage(named: "Search"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = button
    }

    
}

extension RaceListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.races.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbList.dequeueReusableCell(withIdentifier: "RaceCell", for: indexPath) as! RaceCell
        return listViewModel.fill(cell, row: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tbList.frame.height / 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "title", sender: self)
    }
}
