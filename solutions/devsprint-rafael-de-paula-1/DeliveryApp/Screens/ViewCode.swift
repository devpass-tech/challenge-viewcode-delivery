//
//  ViewCode.swift
//  DeliveryApp
//
//  Created by Thyago Raphael on 12/04/22.
//

import Foundation

protocol ViewCode {
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
}

extension ViewCode {
    func setupViewCode() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    func setupExtraConfiguration() {  }
}

