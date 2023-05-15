//
//  AccountsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit


extension AccountsVC: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellID, for: indexPath) as! AccountsCell
        var event = events[indexPath.row]
        cell.AccountTitle.text = event.ProductName
        cell.AccountNumber.text = event.AccountId
        cell.AvailableAcutal.text = event.AvailableBalance
        cell.BalanceActual.text = event.CurrentBalance
        cell.contentView.isUserInteractionEnabled = false
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! AccountsCell
        var event = events[indexPath.row]
        avaliableBalancePass = event.AvailableBalance ?? "Balance Unavaliable"
        currentBalancePass = event.CurrentBalance ?? "Balance Unavalbe"
        if event.id! == nil {
            Alert.show(title: "Error: Account not found", message: "", vc: self)
            return
        } else {
            SAccount = event.id!
            self.mainCor.Accounts(data: SAccount, data1: avaliableBalancePass, data2: currentBalancePass)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("list of retail", events.count)
        return events.count
    }
}
