//
//  TransactionsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit

extension TransactionsVC {
    func setUpTableViewDetails() {
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.layer.zPosition = 100
        tableView.register(TransactionCell.self, forCellReuseIdentifier: homeCellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.alwaysBounceVertical = false
      
        searchBar.layer.zPosition = 100
        searchBar.delegate = self
        searchBar.alpha = 1
        searchBar.backgroundColor = UIColor.white
        searchBar.placeholder = "Search listings"
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = UIColor.white
        searchBar.isTranslucent = false
        searchBar.layer.cornerRadius = 7.5
        searchBar.backgroundColor = UIColor.white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
    }
    func setUpTableView() {
        self.view.addSubview(self.tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 310).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        tableView.backgroundColor = UIColor.white
        
        view.addSubview(AccountName)
        AccountName.topAnchor.constraint(equalTo: view.topAnchor, constant: 65).isActive = true
        AccountName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(UBankLabel)
        UBankLabel.topAnchor.constraint(equalTo: AccountName.bottomAnchor, constant: 25).isActive = true
        UBankLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(logoImage)
        logoImage.topAnchor.constraint(equalTo: UBankLabel.bottomAnchor, constant: 5).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        view.addSubview(AvailableLabel)
        AvailableLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 40).isActive = true
        AvailableLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        view.addSubview(AvailableAcutal)
        AvailableAcutal.topAnchor.constraint(equalTo: AvailableLabel.topAnchor, constant: 0).isActive = true
        AvailableAcutal.leftAnchor.constraint(equalTo: AvailableLabel.rightAnchor, constant: 10).isActive = true
        
        view.addSubview(BalanceLabel)
        BalanceLabel.topAnchor.constraint(equalTo: AvailableLabel.bottomAnchor, constant: 3).isActive = true
        BalanceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        view.addSubview(BalanceActual)
        BalanceActual.topAnchor.constraint(equalTo: AvailableLabel.bottomAnchor, constant: 3).isActive = true
        BalanceActual.leftAnchor.constraint(equalTo: BalanceLabel.rightAnchor, constant: 10).isActive = true
        
        view.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: BalanceActual.bottomAnchor, constant: 5).isActive = true
                searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
                searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
                searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
