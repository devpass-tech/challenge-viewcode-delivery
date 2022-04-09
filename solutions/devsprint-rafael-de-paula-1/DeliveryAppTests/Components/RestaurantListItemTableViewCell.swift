//
//  RestaurantListItemTableViewCell.swift
//  DeliveryAppTests
//
//  Created by Thyago Raphael on 07/04/22.
//

import SnapshotTesting
import XCTest

@testable import DeliveryApp

final class RestauranteCellViewSnapshotTests: XCTestCase {
    
    private let size = CGSize(width: 390, height: 80)
    private let isRecord = false
    
    private lazy var sut = RestaurantListItemTableViewCell()
    
    func test_whenRestaurantNameIsShort() throws {
        sut.configure(with: .init(name: "Abbraccio", category: "Italiana", minDeliveryTime: 65, maxDeliveryTime: 75, icon: "restaurat-logo"))
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
    
    func test_whenRestaurantNameIsLong() throws {
        sut.configure(with: .init(name: "Churrascaria Costelão Gaúcho da Serra", category: "Carnes", minDeliveryTime: 48, maxDeliveryTime: 65, icon: "restaurat-logo"))
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
    
    func test_whenRestaurantIconIsNil() throws {
        sut.configure(with: .init(name: "Bar do Alemão", category: "Brasileira", minDeliveryTime: 42, maxDeliveryTime: 52, icon: nil))
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
}
