//
//  RestaurantCellSpec.swift
//  DeliveryAppTests
//
//  Created by Cleber Reis on 20/09/22.
//

import UIKit
import XCTest
import SnapshotTesting

@testable import DeliveryApp

final class RestaurantCellSpec: XCTestCase {
    
    private var sut: RestaurantCell?
    
    override func setUp() {
        
        sut = RestaurantCell()

        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        
        sut?.frame = frame
        
    }
    
    func test_WhenInitRestaurantCell_ThenView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        assertSnapshot(matching: unwrappedSut, as: .image)
        
    }
    
    override func tearDown() {
        sut = nil
    }
}
