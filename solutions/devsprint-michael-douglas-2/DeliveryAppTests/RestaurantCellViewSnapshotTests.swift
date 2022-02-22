//
//  RestaurantCellViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Pedro Francisco Tres on 22/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class RestaurantCellViewSnapshotTests: XCTestCase {
    
    let size = CGSize(width: 300, height: 80)

    func testRestaurantCellViewSnapshotTests() throws {
        let configuration = RestaurantCellViewConfiguration(restaurantName: "Percoriro Trattoria", restaurantType: "Italiana • 38-48 min", restaurantImage: "restaurant-logo")
        
        let restaurantCellView = RestaurantCellView()
        restaurantCellView.backgroundColor = .white
        restaurantCellView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantCellView, as: .image(size: size))
    }


}
