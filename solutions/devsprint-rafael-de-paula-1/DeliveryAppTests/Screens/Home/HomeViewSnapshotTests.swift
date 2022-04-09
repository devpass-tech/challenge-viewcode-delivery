//
//  HomeViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Rafael de Paula on 09/04/22.
//

import SnapshotTesting
import XCTest

@testable import DeliveryApp

final class HomeViewSnapshotTests: XCTestCase {
    
    private let size = CGSize(width: 414, height: 750)
    private let isRecord = false
    
    private lazy var sut = HomeView()
    
    func test_updateView_shouldReturnCorrectSnapshot() throws {
        sut.updateView(with: mockedRestaurantValues())
        
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
}

extension HomeViewSnapshotTests {
    private func mockedRestaurantValues() -> [Restaurant] {
        return  [
            Restaurant(name: "Lorem ipsum dolor", category: "Lorem ipsum", deliveryTime: DeliveryTime(min: 99, max: 99), logo: "lorem-ipsum"),
            Restaurant(name: "Lorem ipsum dolor", category: "Lorem ipsum", deliveryTime: DeliveryTime(min: 99, max: 99), logo: nil),
            Restaurant(name: "Lorem ipsum dolor", category: "Lorem ipsum", deliveryTime: DeliveryTime(min: 99, max: 99), logo: "lorem-ipsum"),
            Restaurant(name: "Lorem ipsum dolor", category: "Lorem ipsum", deliveryTime: DeliveryTime(min: 99, max: 99), logo: ""),
            Restaurant(name: "Lorem ipsum dolor", category: "Lorem ipsum", deliveryTime: DeliveryTime(min: 99, max: 99), logo: "lorem-ipsum"),
            Restaurant(name: "Lorem ipsum dolor", category: "Lorem ipsum", deliveryTime: DeliveryTime(min: 99, max: 99), logo: ""),
            Restaurant(name: "Lorem ipsum dolor", category: "Lorem ipsum", deliveryTime: DeliveryTime(min: 99, max: 99), logo: nil),
            Restaurant(name: "Lorem ipsum dolor", category: "Lorem ipsum", deliveryTime: DeliveryTime(min: 99, max: 99), logo: "lorem-ipsum")
        ]
    }
}
