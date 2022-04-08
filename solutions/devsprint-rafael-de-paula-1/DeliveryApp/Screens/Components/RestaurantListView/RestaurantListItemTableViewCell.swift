//
//  RestaurantCellView.swift
//  DeliveryApp
//
//  Created by Thyago Raphael on 06/04/22.
//

import UIKit

final class RestaurantListItemTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        
        return stackView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .lightGray
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, detail: String, icon: String) {
        nameLabel.text = name
        detailLabel.text = detail
        iconImageView.image = UIImage(named: icon)
    }
}

extension RestaurantListItemTableViewCell {
    private func setupComponents() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(detailLabel)
    }
    
    private func setupConstraints() {
        setupIconImageViewConstraints()
        setupContentStackViewConstraints()
    }
    
    private func setupIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            iconImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor, constant: 16),
            iconImageView.bottomAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: -16),
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
            iconImageView.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setupContentStackViewConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            contentStackView.topAnchor.constraint(lessThanOrEqualTo: contentView.topAnchor),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            contentStackView.bottomAnchor.constraint(equalTo: detailLabel.topAnchor)
        ])
    }
    
    private func setupExtraConfiguration() {
        backgroundColor = .white
    }
}

