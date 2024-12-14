//
//  File.swift
//  
//
//  Created by Khiem Huynh on 5/9/24.
//

import Foundation

extension Double {
    func formatCurrency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "vi_VN")
        
        return numberFormatter.string(for: self) ?? "--"
    }
}

extension String {
    func formatFromCurrency() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "vi_VN")
        
        return numberFormatter.number(from: self)?.doubleValue
    }
}
