//
//  Transform.swift
//  UBank
//
//  Created by Corry Timothy on 19/5/2023.
//

import Foundation
import Combine

struct Transform {
    func refactorAndInsertIntoViewModel(data: [UBankModel]) -> Future <[UbankAccountViewModel], AsyncError> {
        var array = [UbankAccountViewModel]()
        var d = DateFormatter()
        
        data.forEach {
            
            var CurrentBalance = "".ifLet(s: $0.CurrentBalance)

            let myString = CurrentBalance
            let CurrentBalanceDouble = (myString as NSString).doubleValue
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            let amount = CurrentBalanceDouble
            let CurrentBalanceFinal = formatter.string(from: NSNumber(value: amount))!
            var AvaliableBalance = "".ifLet(s: $0.AvailableBalance)
            let myString2 = AvaliableBalance
            let AvaliableBalanceDouble = (myString2 as NSString).doubleValue
            let formatter2 = NumberFormatter()
            formatter2.numberStyle = .currency
            formatter2.minimumFractionDigits = 2
            formatter2.maximumFractionDigits = 2
            let amount2 = AvaliableBalanceDouble
            let AvaliableBalanceFinal = formatter2.string(from: NSNumber(value: amount2))!
            var AccountName = "".ifLet(s: $0.ProductName)
            var AccountNumber = "".ifLet(s: $0.AccountId)
            var AccountId = "".ifLet(s: $0.id)
            
            var input = UbankAccountViewModel(CurrentBalance: CurrentBalanceFinal, AvailableBalance: AvaliableBalanceFinal, id: AccountId, ProductName: AccountName, AccountNumber: AccountNumber)
            array.append(input)
        }
        
        
        return Future() { promise in
            array.count < 1 ? promise(Result.failure(AsyncError.message("Re fail"))) : promise(Result.success(array)); array.removeAll()
        }
    }
}
