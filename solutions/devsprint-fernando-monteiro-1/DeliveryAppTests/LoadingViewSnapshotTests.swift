//
//  LoadingView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class LoadingViewSnapshotTests: XCTestCase {
    
    func test_loadingView_defaultState() {
        let loadingView = LoadingView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 390, height: 844)

        let result = verifySnapshot(matching: loadingView,
                                    as: .image,
                                    named: "Default",
                                    testName: "LoadingView")

        XCTAssertNil(result)
    }

}
