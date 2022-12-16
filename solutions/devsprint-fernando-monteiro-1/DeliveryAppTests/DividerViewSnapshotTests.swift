//
//  DividerView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class DividerViewSnapshotTests: XCTestCase {
    
    func test_dividerView_defaultState() {
        let dividerView = DividerView()
        dividerView.frame = CGRect(x: 0, y: 0, width: 390, height: 1)
        
        let result = verifySnapshot(matching: dividerView,
                                    as: .image,
                                    named: "Default",
                                    testName: "DividerView")
        
        XCTAssertNil(result)
    }
}
