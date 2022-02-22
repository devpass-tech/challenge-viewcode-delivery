//
//  AddressView.swift
//  DeliveryApp
//
//  Created by Alexandre Cardoso on 21/02/22.
//

import UIKit

protocol AddressViewDelegate: AnyObject {
    func didEditAddress()
}

final class AddressView: UIView {
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R. Guiratinga, 500"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(
            NSAttributedString(
                string: "Editar",
                attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .bold)]
            ),
            for: .normal
        )
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.link.cgColor
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(editAddress(_:)), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: AddressViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(address: String) {
        addressLabel.text = address
    }
    
    private func setupView() {
        buildHierarchy()
        buildConstraints()
    }
    
    private func buildHierarchy() {
        addSubview(addressLabel)
        addSubview(editButton)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            addressLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            editButton.heightAnchor.constraint(equalToConstant: 48),
            editButton.widthAnchor.constraint(equalToConstant: 70),
            editButton.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor, constant: 16),
            editButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    @objc
    private func editAddress(_ sender: UIButton) {
        delegate?.didEditAddress()
    }
    
}
