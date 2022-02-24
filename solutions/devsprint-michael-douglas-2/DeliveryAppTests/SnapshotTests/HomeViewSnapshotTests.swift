//
//  HomeView.swift
//  DeliveryAppTests
//
//  Created by Pedro Francisco Tres on 23/02/22.
//
import Foundation
import XCTest
import SnapshotTesting
@testable import DeliveryApp

class HomeViewSnapshotTests: XCTestCase {
    
    let size = CGSize(width: 400, height: 550)
    
    private let deliveryApi = DeliveryApi()
    
    func test_homeView_whenSnapshot_shouldSucceed() throws {
        
        let homeview = HomeView()
        homeview.updateView(with: self.mockRestaurant())
        
        assertSnapshot(matching: homeview, as: .image(size: size))
    }
}

extension HomeViewSnapshotTests {
    
    public func mockRestaurant () -> [Restaurant] {
        return  [
            Restaurant(name: "Benjamin a Padaria", category: "Padaria", deliveryTime: DeliveryTime(min: 1, max: 2)),
            Restaurant(name: "Pecorino Bar e Trattoria", category: "Italiana", deliveryTime: DeliveryTime(min: 1, max: 2)),
            Restaurant(name: "Bar do alemão e japonês", category: "Brasileira", deliveryTime: DeliveryTime(min: 1, max: 2)),
            Restaurant(name: "Abbracio apertado", category: "Chilena", deliveryTime: DeliveryTime(min: 1, max: 2)),
            Restaurant(name: "Poke Garden", category: "Italiana", deliveryTime: DeliveryTime(min: 1, max: 2)),
            Restaurant(name: "Bar Cana Benta", category: "Brasileira", deliveryTime: DeliveryTime(min: 1, max: 2)),
            Restaurant(name: "Tradi Vila Nova", category: "Ucrania", deliveryTime: DeliveryTime(min: 1, max: 2)),
            Restaurant(name: "Brahauli", category: "Alemanha", deliveryTime: DeliveryTime(min: 1, max: 2))
        ]
    }
    
}


