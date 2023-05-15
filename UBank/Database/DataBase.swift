//
//  DataBase.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import Firebase
import UIKit

class Info: NSObject {
   
    var CurrentBalance: String?
    var AvailableBalance: String?
    var id: String?
    var ProductName: String?
    var AccountId: String?
    var Amount: String?
    var Date: String?
    var Desc: String?
    var Time: String?
    var Receipt: String?
 
    init(dictionary: [String: AnyObject]) {
        
        self.CurrentBalance = dictionary["CurrentBalance"] as? String
        self.AvailableBalance = dictionary["AvailableBalance"] as? String
        self.id = dictionary["id"] as? String
        self.ProductName = dictionary["ProductName"] as? String
        self.AccountId = dictionary["AccountId"] as? String
        self.Amount = dictionary["Amount"] as? String
        self.Date = dictionary["Date"] as? String
        self.Desc = dictionary["Desc"] as? String
        self.Time = dictionary["Time"] as? String
        self.Receipt = dictionary["Receipt"] as? String
    }
}
