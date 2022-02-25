//
//  RestaurantCellViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Pedro Francisco Tres on 22/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class RestaurantCellViewSnapshotTests: XCTestCase {
    
    let size = CGSize(width: 300, height: 80)
    let isRecord = false

    func test_restaurantCell_whenSnapshot_shouldSucceed() throws {
        let configuration = RestaurantCellViewConfiguration(name: "Percoriro Trattoria", detail: "Italiana • 38-48 min", icon: "restaurant-logo")
        
        let restaurantCellView = RestaurantCellView(style: .default, reuseIdentifier: nil)
        restaurantCellView.backgroundColor = .white
        restaurantCellView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_restaurantCell_whenSnapshot_noName() throws {
        let configuration = RestaurantCellViewConfiguration(name: "", detail: "Italiana • 38-48 min", icon: "restaurant-logo")
        
        let restaurantCellView = RestaurantCellView(style: .default, reuseIdentifier: nil)
        restaurantCellView.backgroundColor = .white
        restaurantCellView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_restaurantCell_whenSnapshot_noDetail() throws {
        let configuration = RestaurantCellViewConfiguration(name: "Percoriro Trattoria", detail: "", icon: "restaurant-logo")
        
        let restaurantCellView = RestaurantCellView(style: .default, reuseIdentifier: nil)
        restaurantCellView.backgroundColor = .white
        restaurantCellView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_restaurantCell_whenSnapshot_noImage() throws {
        let configuration = RestaurantCellViewConfiguration(name: "Percoriro Trattoria", detail: "Italiana • 38-48 min", icon: "")
        
        let restaurantCellView = RestaurantCellView(style: .default, reuseIdentifier: nil)
        restaurantCellView.backgroundColor = .white
        restaurantCellView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_restaurantCell_whenSnapshot_largeName() throws {
        let configuration = RestaurantCellViewConfiguration(name: "Percorirorororo Bar e Trattoria teste large name", detail: "Italiana • 38-48 min", icon: "restaurant-logo")
        
        let restaurantCellView = RestaurantCellView(style: .default, reuseIdentifier: nil)
        restaurantCellView.backgroundColor = .white
        restaurantCellView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_restaurantCell_whenSnapshot_largeDetail() throws {
        let configuration = RestaurantCellViewConfiguration(name: "Percoriro Trattoria", detail: "Italiana/Portuguesa - Francesa • 388-489 min", icon: "restaurant-logo")
        
        let restaurantCellView = RestaurantCellView(style: .default, reuseIdentifier: nil)
        restaurantCellView.backgroundColor = .white
        restaurantCellView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantCellView, as: .image(size: size), record: isRecord)
    }

}
