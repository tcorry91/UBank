//
//  CustomColors.swift
//  UBank
//
//  Created by Corry Timothy on 6/5/2023.
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
    static let BankNote = UIColor(r: 251, g: 227, b: 65)
    static let Background = UIColor(r: 255, g: 126, b: 10)
}
