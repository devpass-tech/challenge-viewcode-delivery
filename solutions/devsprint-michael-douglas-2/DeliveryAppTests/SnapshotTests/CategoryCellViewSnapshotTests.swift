//
//  CategoryCellViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Murillo R. Araújo on 22/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class CategoryCellViewSnapshotTests: XCTestCase {

    let snapshotSize = CGSize(width: 100, height: 100)

    func testPropertyInfoView() {
        let categoryCellView = CategoryCellView()

        assertSnapshot(matching: categoryCellView, as: .image(size: snapshotSize))
    }
}
