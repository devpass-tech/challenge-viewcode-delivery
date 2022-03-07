//
//  Double+Extensions.swift
//  DeliveryApp
//
//  Created by Hyago Henrique on 04/03/22.
//

import Foundation

extension Double {
    func formatWithCurrency(_ locale: String? = nil) -> String? {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale.current
        
        if let locale = locale {
            formatter.locale = Locale(identifier: locale)
        }
        return formatter.string(from: NSNumber(value: self))
    }
}
