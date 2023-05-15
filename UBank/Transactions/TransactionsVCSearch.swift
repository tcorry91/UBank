//
//  TransactionsVCSearch.swift
//  UBank
//
//  Created by Corry Timothy on 15/5/2023.
//

import Foundation
import UIKit

extension TransactionsVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searching = false
            searchBar.text = ""
            eventArraySearch = []
            tableView.reloadData()
        } else {
            filterStuff(Text: searchText)
        searching = true
        tableView.reloadData()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      
    }
    
    
    
    
}
