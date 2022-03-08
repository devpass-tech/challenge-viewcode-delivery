//
//  RestaurantInfoViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by pedro tres on 07/03/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class RestaurantInfoViewSnapshotTests: XCTestCase {
    
    let size = CGSize(width: 400, height: 100)
    let isRecord = false
    
    func test_restaurantInfoView_whenSnapshot_shouldSucceed() {
        let configuration = RestaurantInfoViewConfiguration(
            name: "Benjamin A Padaria",
            detail: "Padaria • 23-33 min",
            icon: "restaurant-logo"
        )
        
        let restaurantInfoView = RestaurantInfoView()
        restaurantInfoView.backgroundColor = .white
        restaurantInfoView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantInfoView, as: .image(size: size), record: isRecord)
        
    }
    
    func test_restaurantInfoView_whenSnapshot_noName() {
        let configuration = RestaurantInfoViewConfiguration(
            name: "",
            detail: "Padaria • 23-33 min",
            icon: "restaurant-logo"
        )
        
        let restaurantInfoView = RestaurantInfoView()
        restaurantInfoView.backgroundColor = .white
        restaurantInfoView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantInfoView, as: .image(size: size), record: isRecord)
        
    }
    
    func test_restaurantInfoView_whenSnapshot_noDetail() {
        let configuration = RestaurantInfoViewConfiguration(
            name: "Benjamin A Padaria",
            detail: "",
            icon: "restaurant-logo"
        )
        
        let restaurantInfoView = RestaurantInfoView()
        restaurantInfoView.backgroundColor = .white
        restaurantInfoView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantInfoView, as: .image(size: size), record: isRecord)
        
    }
    
    func test_restaurantInfoView_whenSnapshot_noIcon() {
        let configuration = RestaurantInfoViewConfiguration(
            name: "Benjamin A Padaria",
            detail: "Padaria • 23-33 min",
            icon: ""
        )
        
        let restaurantInfoView = RestaurantInfoView()
        restaurantInfoView.backgroundColor = .white
        restaurantInfoView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantInfoView, as: .image(size: size), record: isRecord)
        
    }
    
    func test_restaurantInfoView_whenSnapshot_longName() {
        let configuration = RestaurantInfoViewConfiguration(
            name: "Benjamin A Padaria, só aqui as delícias do trigo",
            detail: "Padaria • 23-33 min",
            icon: ""
        )
        
        let restaurantInfoView = RestaurantInfoView()
        restaurantInfoView.backgroundColor = .white
        restaurantInfoView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantInfoView, as: .image(size: size), record: isRecord)
        
    }
    
    func test_restaurantInfoView_whenSnapshot_LongDetail() {
        let configuration = RestaurantInfoViewConfiguration(
            name: "Benjamin A Padaria",
            detail: "A melhor Padaria de todo o brasil trazendo as delicias • 23-33 min",
            icon: ""
        )
        
        let restaurantInfoView = RestaurantInfoView()
        restaurantInfoView.backgroundColor = .white
        restaurantInfoView.updateView(with: configuration)
        
        assertSnapshot(matching: restaurantInfoView, as: .image(size: size), record: isRecord)
    }
}
