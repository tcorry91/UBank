//
//  ViewModel.swift
//  UBank
//
//  Created by Corry Timothy on 19/5/2023.
//

import Foundation


struct UbankAccountViewModel:Codable {
    var CurrentBalance: String?
    var AvailableBalance: String?
    var id: String?
    var ProductName: String?
    var AccountNumber: String?
}

struct Transactions:Codable {
    var Amount: String?
    var Date: String?
    var Desc: String?
    var Time: String?
    var Receipt: String?
}
