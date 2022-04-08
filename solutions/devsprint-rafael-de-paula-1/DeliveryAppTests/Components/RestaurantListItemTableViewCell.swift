//
//  RestaurantListItemTableViewCell.swift
//  DeliveryAppTests
//
//  Created by Thyago Raphael on 07/04/22.
//

import XCTest
import SnapshotTesting

@testable import DeliveryApp

class RestauranteCellViewSnapshotTests: XCTestCase {
    
    let size = CGSize(width: 300, height: 80)
    let isRecord = true
    
    func test_tableViewCell_shouldSucceed() throws {
        let sut = RestaurantListItemTableViewCell()
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
    
}
