//
//  RestaurantCellSpec.swift
//  DeliveryAppTests
//
//  Created by Cleber Reis on 20/09/22.
//

import Foundation
import XCTest
import SnapshotTesting

@testable import DeliveryApp

final class RestaurantCellSpec: XCTestCase {
    
    private var sut: RestaurantCell?
    
    override func setUp() {
        
        sut = RestaurantCell()
        
        sut?.widthAnchor.constraint(equalToConstant: 400).isActive = true
        sut?.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
    }
    
    func test_WhenInitRestaurantCell_ThenView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        assertSnapshot(matching: unwrappedSut, as: .image)
        
    }
    
    override func tearDown() {
        sut = nil
    }
}
