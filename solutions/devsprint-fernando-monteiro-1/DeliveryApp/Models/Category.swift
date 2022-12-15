//
//  Category.swift
//  DeliveryApp
//
//  Created by Christian Rezende on 13/12/22.
//


import Foundation

struct Category: Decodable {
    let name: String
    let imageName: String
}



#if DEBUG
extension Category {
    
    static func stub() -> Category {
        Category(
            name: "Mercado",
            imageName: "pizza.jpeg"
        )
    }
    
}
#endif
