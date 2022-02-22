//
//  EmptyViewSnapshot.swift
//  DeliveryAppTests
//
//  Created by Sara Batista dos Santos Felix (P) on 22/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class EmptyViewSnapshot: XCTestCase {
    
    func testEmptyView() {
        let emptyView = EmptyView()
        
        assertSnapshot(matching: emptyView, as: Snapshotting.image(size: CGSize(width: 400, height: 400)), record: true)
    }
}
