//
//  AdressCell.swift
//  DeliveryApp
//
//  Created by Daniel  Alves Barreto on 20/07/22.
//

import Foundation
import UIKit

final class AddressCell: UITableViewCell {
    private lazy var container: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 4
        view.addArrangedSubview(addressLabel)
        view.addArrangedSubview(neighborhoodLabel)
        return view
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var neighborhoodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    func updateView(address: String, neighborhood: String){
        addressLabel.text = address
        neighborhoodLabel.text = neighborhood
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddressCell: ViewCode {
    func setupSubviews() {
        addSubview(container)
    }
    
    func setupConstraints() {
        setupContainerConstraints()
    }
    
    func setupContainerConstraints(){
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
