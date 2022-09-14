//
//  RestaurantDetails.swift
//  DeliveryApp
//
//  Created by Rodrigo Borges on 15/02/22.
//

import Foundation

struct RestaurantDetails: Decodable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
    let reviews: Reviews
    let menu: [MenuItem]
}

struct Reviews: Decodable {
    let score: Float
    let count: Int
}

struct MenuItem: Decodable {
    let category: String
    let name: String
    let price: Int
}

