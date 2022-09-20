//
//  EmptyViewSpec.swift
//  DeliveryAppTests
//
//  Created by Cora on 20/09/22.
//

import Foundation
import XCTest
import SnapshotTesting

@testable import DeliveryApp

final class EmptyViewSpec: XCTestCase {
    private var sut: UIView?
    
    override func setUp() {
        sut = EmptyView()

        sut?.widthAnchor.constraint(equalToConstant: 300).isActive = true
        sut?.heightAnchor.constraint(equalToConstant: 720).isActive = true
    }
    
    func test_WhenInitEmptyView_ThenShowView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        assertSnapshot(matching: unwrappedSut, as: .image)
    }
    
    override func tearDown() {
        sut = nil
    }
}
