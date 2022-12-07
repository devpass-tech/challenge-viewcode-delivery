//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
}

struct DeliveryTime: Decodable {
    let min: Int
    let max: Int
}


#if DEBUG
extension Restaurant {
    
    static func stub() -> Restaurant {
        Restaurant(
            name: "Amarelinho",
            category: "Brasileira",
            deliveryTime: DeliveryTime(min: 50, max: 120)
        )
    }
    
}
#endif
