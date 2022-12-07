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

#if DEBUG
extension RestaurantDetails {
    
    static func stub() -> RestaurantDetails {
        RestaurantDetails(
            name: "Amarelinho",
            category: "Brasileira",
            deliveryTime: DeliveryTime(min: 50, max: 120),
            reviews: Reviews(score: 4.8, count: 200),
            menu: [
                MenuItem(category: "Almoço", name: "Bobó de Camarão", price: 80),
                MenuItem(category: "Almoço", name: "Filé Oswaldo Aranha", price: 90),
                MenuItem(category: "Bebidas", name: "Refrigerante", price: 5),
                MenuItem(category: "Bebidas", name: "Água com gás", price: 5),
                MenuItem(category: "Bebidas", name: "Suco natural da fruta", price: 10),
            ]
        )
    }

}
#endif
