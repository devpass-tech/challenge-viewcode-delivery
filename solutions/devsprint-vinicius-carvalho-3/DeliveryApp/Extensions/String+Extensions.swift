//
//  String+Extensions.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import Foundation

extension String {

    static func formattedRestaurantInfo(category: String, minDeliveryTime: Int, maxDeliveryTime: Int) -> String {

        return "\(category) • \(minDeliveryTime)-\(minDeliveryTime) min"
    }
    
    static func currencyValue(value: Int) -> String {
        
        let formatterNumber = NumberFormatter()
        formatterNumber.locale = Locale.current
        formatterNumber.numberStyle = .currency
        
        return formatterNumber.string(from: NSNumber(value: value))!
    }
}
