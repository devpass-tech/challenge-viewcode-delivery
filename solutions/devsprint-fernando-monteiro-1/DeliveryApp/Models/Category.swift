//
//  Category.swift
//  DeliveryApp
//
//  Created by José Vitor Scheffer Boff dos Santos on 16/12/22.
//

import Foundation

struct Category: Decodable, Hashable {
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
