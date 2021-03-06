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
