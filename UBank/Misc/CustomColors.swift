//
//  CustomColors.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
extension UIColor {
    static let MainTitle = UIColor(r: 116, g: 116, b: 116)
    static let Line = UIColor(r: 232, g: 232, b: 232)
    static let Background = UIColor(r: 252, g: 195, b: 1)
    static let BankNote = UIColor(r: 74, g: 173, b: 23)
    static let MoneyGreen = UIColor(r: 21, g: 196, b: 51)
    static let CustomWhite = UIColor(r: 248, g: 248, b: 248)
    static let CustomBlack = UIColor(r: 42, g: 42, b: 48)
    static let Customgrey = UIColor(r: 1, g: 1, b: 2)
}
