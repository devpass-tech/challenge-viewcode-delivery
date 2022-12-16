//
//  RestaurantCellView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class RestaurantCellViewSnapshotTests: XCTestCase {
    
    func test_restaurantCellView_defaultState() {
        let restaurantCellView = RestaurantCellView()
        restaurantCellView.setupCell(restaurant: .stub())
        restaurantCellView.frame = CGRect(x: 0, y: 0, width: 390, height: 64)
        
        let result = verifySnapshot(matching: restaurantCellView,
                                    as: .image,
                                    named: "Default",
                                    testName: "RestaurantCellView")
        
        XCTAssertNil(result)
    }
}
