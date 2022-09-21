//
//  CategoryCellSpec.swift
//  DeliveryAppTests
//
//  Created by Diogenes Pereira on 20/09/22.
//

import XCTest
import SnapshotTesting

@testable import DeliveryApp

final class CategoryCellSpec: XCTestCase {

    private var sut: CategoryCell?

    override func setUp() {
        sut = CategoryCell()

        sut?.widthAnchor.constraint(equalToConstant: 90).isActive = true
        sut?.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func test_WhenInitCategoryCell_ThenShowCell_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        assertSnapshot(matching: unwrappedSut, as: .image)
    }

    func test_WhenInitCategoryCell_ThenShowCellNewCategory_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        unwrappedSut.changeCategoryName("Lanches")
        assertSnapshot(matching: unwrappedSut, as: .image)
    }

    override func tearDown() {
        sut = nil
    }
}
