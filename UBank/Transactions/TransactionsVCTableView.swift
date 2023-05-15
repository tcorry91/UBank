//
//  TransactionsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit
import Combine

extension TransactionsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellID, for: indexPath) as! TransactionCell
        var event = events[indexPath.row]
        
        if searching {
            print("searching started")
             event = eventArraySearch[indexPath.row]
        } else {
            event = events[indexPath.row]
        }
        
        
        cell.contentView.isUserInteractionEnabled = false
        cell.selectionStyle = .none
        cell.TransactionCurrency.text = event.Amount
        cell.Transaction.text = event.Desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        EventId = event.id!
        if event.id! == nil {
            Alert.show(title: "Error: Transaction not found", message: "", vc: self)
            return
        } else {
            self.mainCor.TransactionDetails(data: EventId, data1: SelectedAccount)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
         return eventArraySearch.count
        
        } else {
            return events.count
        }
    }
}
