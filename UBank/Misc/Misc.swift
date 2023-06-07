//
//  Misc.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit
import Combine

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}

extension String {
    
    func ifLet(s: String?) -> String {
        if let s = s {
            return s
        } else { return "" }
    }
    func ifLetItS(i: Int?) -> String {
        if let i = i {
            return String(i)
        } else { return "" }
    }
    
    func sDoubleToString(d: Double?) -> String {
        if let d = d {
            return String(d)
        } else { return "" }
    }
    
    func sReFormatDate(s: String, form1: DateFormatter, form2: DateFormatter) -> String {
        if let date = form1.date(from: s) {
            return form2.string(from: date)
        } else { return "" }
    }
    
}



enum AsyncError: Error {
    case message(String)
}
