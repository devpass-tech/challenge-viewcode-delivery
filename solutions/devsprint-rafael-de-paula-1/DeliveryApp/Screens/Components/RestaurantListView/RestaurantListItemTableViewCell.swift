//
//  RestaurantCellView.swift
//  DeliveryApp
//
//  Created by Thyago Raphael on 06/04/22.
//

import UIKit

final class RestaurantListItemTableViewCell: UITableViewCell {
    
    // MARK: - Configuration
    
    struct ViewModel {
        let name: String
        let category: String
        let minDeliveryTime: Int
        let maxDeliveryTime: Int
        let icon: String?
    }
    
    enum Configuration {
        static let horizontalMargin: CGFloat = 20
        static let verticalMargin: CGFloat = 16
        static let imageSize: CGFloat = 48
    }
    
    static let identifier = "RestaurantListItemTableViewCell"
    
    // MARK: - UI Components
    
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.clipsToBounds = true
        image.layer.cornerRadius = Configuration.imageSize / 2
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(detailLabel)
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(verticalStackView)
        return stackView
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
    
    func configure(with viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        detailLabel.text = .formattedRestaurantInfo(category: viewModel.category, minDeliveryTime: viewModel.minDeliveryTime, maxDeliveryTime: viewModel.maxDeliveryTime)
        
        if let iconName = viewModel.icon, !iconName.isEmpty {
            iconImageView.image = UIImage(named: iconName)
        } else {
            iconImageView.isHidden = true
        }        
    }
}

extension RestaurantListItemTableViewCell {
    private func setupComponents() {
        contentView.addSubview(horizontalStackView)
    }
    
    private func setupConstraints() {
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        setupIconImageViewConstraints()
        setupStackViewConstraints()
    }
    
    private func setupIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: Configuration.imageSize),
            iconImageView.widthAnchor.constraint(equalToConstant: Configuration.imageSize)
        ])
    }
    
    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Configuration.horizontalMargin),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Configuration.horizontalMargin),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Configuration.verticalMargin),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Configuration.verticalMargin)
        ])
    }
    
    private func setupExtraConfiguration() {
        backgroundColor = .white
        accessoryType = .disclosureIndicator
    }
}
