//
//  ViewCode.swift
//  DeliveryApp
//
//  Created by Vitor Conceicao on 19/07/22.
//

import Foundation

protocol ViewCode {
    func setupSubviews()
    func setupConstraint()
    func setupExtraConfiguration()
    func setup()
}

extension ViewCode {
    func setup() {
        setupSubviews()
        setupConstraint()
        setupExtraConfiguration()
    }
    
    func setupExtraConfiguration() {}
}
