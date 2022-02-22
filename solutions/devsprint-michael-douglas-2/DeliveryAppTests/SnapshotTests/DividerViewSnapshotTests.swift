//
//  DividerViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Murillo R. Araújo on 22/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class DividerViewSnapshotTests: XCTestCase {

    let snapshotSize = CGSize(width: 200, height: 100)

    func testDividerView() {
        let dividerView = DividerView()

        assertSnapshot(matching: dividerView, as: .image(size: snapshotSize))
    }
}
