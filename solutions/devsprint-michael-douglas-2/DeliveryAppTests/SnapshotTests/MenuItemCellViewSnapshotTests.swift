//
//  MenuItemCellViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Hyago Henrique on 26/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class MenuItemCellViewSnapshotTests: XCTestCase {

    let recordTest: Bool = false
    let snapshotSize = CGSize(width: 250, height: 100)
    let sut = MenuItemCellView()

    func test_menuItemViewCell_whenSnapshot_shouldSucceed() {
        assertSnapshot(matching: sut, as: .image(size: snapshotSize), record: recordTest)
    }
    
    func test_menuItemViewCell_whenSnapshot_withData() {
        sut.configure(with: .init(title: "Nome", price: 10, icon: "pizza"))
        
        assertSnapshot(matching: sut, as: .image(size: snapshotSize), record: recordTest)
    }
    
    func test_menuItemViewCell_whenSnapshot_withSomeData() {
        sut.configure(with: .init(title: "", price: 20, icon: "pizza"))
        
        assertSnapshot(matching: sut, as: .image(size: snapshotSize), record: recordTest)
    }
    
    func test_menuItemViewCell_whenSnapshot_withoutData() {
        sut.configure(with: .init(title: "", price: 0, icon: ""))
        
        assertSnapshot(matching: sut, as: .image(size: snapshotSize), record: recordTest)
    }
}
