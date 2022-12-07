//
//  Address.swift
//  DeliveryApp
//
//  Created by Rodrigo Borges on 15/02/22.
//

import Foundation

struct Address: Decodable {
    let street: String
    let number: String
    let neighborhood: String
}

#if DEBUG
extension Address {
    
    static func stub() -> Address {
        Address(
            street: "Hogwarts Street",
            number: "24",
            neighborhood: "Hogsmead"
        )
    }
    
}
#endif
