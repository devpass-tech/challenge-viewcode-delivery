//
//  RestaurantListView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class RestaurantListViewSnapshotTests: XCTestCase {

    func test_restaurantListView_defaultState() {
        let restaurantListView = RestaurantListView()
        restaurantListView.updateTableView(restaurants: [.stub(), .stub(), .stub(), .stub(), .stub()])
        restaurantListView.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        
        let result = verifySnapshot(matching: restaurantListView,
                                    as: .image,
                                    named: "Default",
                                    testName: "RestaurantListView")
        
        XCTAssertNil(result)
    }
}
