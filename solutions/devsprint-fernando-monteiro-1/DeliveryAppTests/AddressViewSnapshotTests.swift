//
//  AddressView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class AddressViewSnapshotTests: XCTestCase {
    
    func test_addressView_defaultState() {
        let addressView = AddressView()
        addressView.frame = CGRect(x: 0, y: 0, width: 390, height: 66)
        
        let result = verifySnapshot(matching: addressView,
                                    as: .image,
                                    named: "Default",
                                    testName: "AddressView")
        
        XCTAssertNil(result)
    }
}
