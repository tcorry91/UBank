//
//  AccountsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit

extension AccountsVC {
    
    func setUpTableViewDetails() {
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.layer.zPosition = 100
        tableView.register(AccountsCell.self, forCellReuseIdentifier: homeCellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.alwaysBounceVertical = false
        
    }
    func setUpTableView() {
        view.addSubview(AccountsLabel)
        AccountsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        AccountsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        AccountsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(WhiteLabel)
        WhiteLabel.topAnchor.constraint(equalTo: AccountsLabel.bottomAnchor, constant: 5).isActive = true
        WhiteLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        WhiteLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        WhiteLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        view.addSubview(UpcomingLabel)
        UpcomingLabel.centerYAnchor.constraint(equalTo: WhiteLabel.centerYAnchor, constant: 0).isActive = true
        UpcomingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(UpcomingPaymentsButton)
        UpcomingPaymentsButton.centerYAnchor.constraint(equalTo: WhiteLabel.centerYAnchor, constant: 0).isActive = true
        UpcomingPaymentsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        UpcomingPaymentsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        UpcomingPaymentsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        UpcomingPaymentsButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
       
        
        view.addSubview(CalendarImage)
        CalendarImage.topAnchor.constraint(equalTo: UpcomingLabel.topAnchor, constant: 0).isActive = true
        CalendarImage.leftAnchor.constraint(equalTo: AccountsLabel.leftAnchor, constant: 0).isActive = true
        CalendarImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        CalendarImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        self.view.addSubview(self.tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        tableView.backgroundColor = UIColor.white
    }
}
