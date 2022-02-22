//
//  DividerView.swift
//  DeliveryApp
//
//  Created by Murillo R. Araújo on 22/02/22.
//

import UIKit

class DividerView: UIView {

    init() {
        super.init(frame: .zero)
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 1)
    }

    func setStyle() {
        backgroundColor = .lightGray
    }
}
