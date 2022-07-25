//
//  AddressView.swift
//  DeliveryApp
//
//  Created by Vitor Conceicao on 21/07/22.
//

import UIKit

final class AddressView: UIView {
    private lazy var addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.font = .boldSystemFont(ofSize: 15)
        return addressLabel
    }()
    
    private lazy var editButton: UIButton = {
        let buttonVerticalPadding: CGFloat = 10.0
        let buttonHorizontalPadding: CGFloat = 16.0
        
        let editButton = UIButton(configuration: .plain())
        editButton.configuration?.subtitle = "Editar"
        editButton.configuration?.background.strokeColor = .systemBlue
        editButton.configuration?.background.strokeWidth = 2.0
        editButton.configuration?.cornerStyle = .large
        editButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: buttonVerticalPadding,
                                                                          leading: buttonHorizontalPadding,
                                                                          bottom: buttonVerticalPadding,
                                                                          trailing: buttonHorizontalPadding)
        editButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return editButton
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = spacing
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .center
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        return horizontalStackView
    }()
    
    // MARK: private properties
    
    private let spacing: CGFloat = 16.0
    
    // MARK: inits
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    // MARK: configuration
    
    struct AddressViewConfiguration {
        let address: String
    }
    
    // MARK: methods
    
    func updateView(with configuration: AddressViewConfiguration) {
        addressLabel.text = configuration.address
    }
}

extension AddressView: ViewCode {
    func setupSubviews() {
        horizontalStackView.addArrangedSubview(addressLabel)
        horizontalStackView.addArrangedSubview(editButton)
        
        addSubview(horizontalStackView)
    }
    
    func setupConstraints() {
        setupHorizontalStackViewConstraints()
    }
    
    private func setupHorizontalStackViewConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: spacing),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing)
        ])
    }
}
