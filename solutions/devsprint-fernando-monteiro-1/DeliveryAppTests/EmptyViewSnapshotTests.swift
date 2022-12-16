//
//  EmptyView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class EmptyViewSnapshotTests: XCTestCase {
    
    func test_emptyView_defaultState() {
        let emptyView = EmptyView.stub()
        emptyView.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        
        let result = verifySnapshot(matching: emptyView,
                                    as: .image,
                                    named: "Default",
                                    testName: "EmptyView")
        
        XCTAssertNil(result)
    }

}
