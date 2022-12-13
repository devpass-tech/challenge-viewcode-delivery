//
//  CategoryCellView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class CategoryCellViewSnapshotTests: XCTestCase {
    func test_categorycell_view_defaultState() {
        let emtpyView = CategoryCellView.stub()
        emtpyView.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        
        let result = verifySnapshot(matching: emtpyView,
                                    as: .image,
                                    named: "Default",
                                    testName: "CategoryCellView")
        XCTAssertNil(result)
    }
}
