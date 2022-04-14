//
//  CategoryItemCollectionViewCellSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Rafael de Paula on 13/04/22.
//

import SnapshotTesting
import XCTest

@testable import DeliveryApp

final class CategoryItemCollectionViewCellSnapshotTests: XCTestCase {

    private let size = CGSize(width: 54, height: 80)
    private let isRecord = false
    
    private lazy var sut = CategoryItemCollectionViewCell()
    
    func test_configure_whenDescriptionIsShort_shouldReturnCorrectSnapshot() throws {
        sut.configure(description: "Mercado", imageName: "pizza")
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
    
    func test_configure_whenDescriptionIsLong_shouldReturnCorrectSnapshot() throws {
        sut.configure(description: "Culinária Italiana", imageName: "pizza")
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
}
