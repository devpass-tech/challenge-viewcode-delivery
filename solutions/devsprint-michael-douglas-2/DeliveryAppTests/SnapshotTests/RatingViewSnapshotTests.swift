//
//  RatingViewSnapshotTests.swift
//  DeliveryAppTests
//
//  Created by Murillo R. Araújo on 23/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class RatingViewSnapshotTests: XCTestCase {

    let snapshotSize = CGSize(width: 300, height: 100)

    func test_ratingView_whenSnapshot_shouldSucceed() {
        let ratingView = RatingView()
        let viewModel = RatingViewModel(score: "4.8 ★★★★★",  rating: "351 avaliações")

        ratingView.configure(with: viewModel)

        assertSnapshot(matching: ratingView, as: .image(size: snapshotSize))
    }
}
