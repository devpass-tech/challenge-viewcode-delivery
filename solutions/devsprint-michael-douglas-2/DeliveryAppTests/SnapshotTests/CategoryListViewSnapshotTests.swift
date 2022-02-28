//
//  CategoryListViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Murillo R. Araújo on 28/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class CategoryListViewSnapshotTests: XCTestCase {

    let snapshotSize = CGSize(width: 300, height: 110)

    func test_categoryListView_whenSnapshot_shouldSucceed() {
        let categoryListView = CategoryListView()

        assertSnapshot(matching: categoryListView, as: .image(size: snapshotSize))
    }
}
