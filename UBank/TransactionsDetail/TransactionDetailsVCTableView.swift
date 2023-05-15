//
//  TransactionDetailsVC.swift
//  UBank
//
//   Created by Corry Timothy on 8/5/2023..
//

import Foundation
import UIKit


extension TransactionDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellID, for: indexPath) as! TransactionDetailsCell
        var event = events[indexPath.row]
        cell.contentView.isUserInteractionEnabled = false
        cell.selectionStyle = .none
        cell.MoneyLabel.text = event.Amount
        cell.TransactionActualLabel.text = event.Desc
        cell.TransacitonDateLabel.text = event.Date
        cell.TransacitonTimeLabel.text = event.Time
        cell.ReceiptNumberLabel.text = event.Receipt
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
}
