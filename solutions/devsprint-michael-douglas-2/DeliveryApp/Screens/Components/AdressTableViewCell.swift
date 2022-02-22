//
//  AdressTableViewCell.swift
//  DeliveryApp
//
//  Created by Michelli Cristina de Paulo Lima on 22/02/22.
//

import UIKit

class AdressTableViewCell: UITableViewCell {

    private lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .leading
        return stack
    }()

}
