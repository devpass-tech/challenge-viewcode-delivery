//
//  AddressViewSnapshotTest.swift
//  DeliveryAppTests
//
//  Created by Alexandre Cardoso on 27/02/22.
//

import XCTest
import SnapshotTesting

@testable import DeliveryApp

final class AddressViewSnapshotTest: XCTestCase {
    
    func test_AddressView_DefaultAddress() {
        let frame = CGRect(x: 0, y: 0, width: 375, height: 66)
        let view = AddressView(frame: frame)
        
        assertSnapshot(matching: view, as: .image, record: false)
    }
    
    func test_AddressView_InformedAddress() {
        let frame = CGRect(x: 0, y: 0, width: 375, height: 66)
        let view = AddressView(frame: frame)
        
        view.updateView(address: "Avenida Paulista, 1000")
        
        assertSnapshot(matching: view, as: .image, record: false)
    }
}
