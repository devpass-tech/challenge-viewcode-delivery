//
//  LoadingViewTests.swift
//  DeliveryAppTests
//
//  Created by Hyago Henrique on 23/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryApp

class LoadingViewTests: XCTestCase {

    let isRecord: Bool = false
    let snapshotSize = CGSize(width: 400, height: 400)
    let sut: LoadingView = LoadingView(isTesting: true)

    func test_loadingView_whenSnapshot_shouldSucceed() {

        assertSnapshot(matching: sut, as: .image(size: snapshotSize), record: isRecord)
    }
    
    func test_loadingView_whenChangeMessage_shouldSucceed() {
        sut.setLoadingMessage("Nova mensagem")

        assertSnapshot(matching: sut, as: .image(size: snapshotSize), record: isRecord)
    }
}
