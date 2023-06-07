//
//  TransactionsDetailsLayout.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit

extension TransactionDetailsVC {
    
    func setupTableViewDetails() {
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.layer.zPosition = 100
        tableView.register(TransactionDetailsCell.self, forCellReuseIdentifier: homeCellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.alwaysBounceVertical = false
    }
    
    func setUpTableView() {
        self.view.addSubview(self.tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
}

