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
        let categoryCellView = CategoryCellView()
        categoryCellView.frame = CGRect(x: 0, y: 0, width: 60, height: 80)
        categoryCellView.setupView(.stub())
        let result = verifySnapshot(matching: categoryCellView,
                                    as: .image,
                                    named: "Default",
                                    testName: "CategoryCellView")
        XCTAssertNil(result)
    }
}
