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
        
        view.addSubview(searchBarBackground)
        searchBarBackground.topAnchor.constraint(equalTo: BalanceActual.bottomAnchor, constant: 5).isActive = true
        searchBarBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        searchBarBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        searchBarBackground.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(searchImage)
        searchImage.centerYAnchor.constraint(equalTo: searchBarBackground.centerYAnchor, constant: 0).isActive = true
        searchImage.leftAnchor.constraint(equalTo: searchBarBackground.leftAnchor, constant: 20).isActive = true
        searchImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        searchImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(xForSearchImage)
        xForSearchImage.centerYAnchor.constraint(equalTo: searchBarBackground.centerYAnchor, constant: 0).isActive = true
        xForSearchImage.rightAnchor.constraint(equalTo: searchBarBackground.rightAnchor, constant: -10).isActive = true
        xForSearchImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        xForSearchImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(generalTextField)
        generalTextField.centerYAnchor.constraint(equalTo: searchBarBackground.centerYAnchor, constant: 3).isActive = true
        generalTextField.leftAnchor.constraint(equalTo: searchImage.rightAnchor, constant: 20).isActive = true
        generalTextField.rightAnchor.constraint(equalTo: xForSearchImage.leftAnchor, constant: -10).isActive = true
        generalTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(EmptySearch)
        EmptySearch.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        EmptySearch.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        EmptySearch.heightAnchor.constraint(equalToConstant: 100).isActive = true
        EmptySearch.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

