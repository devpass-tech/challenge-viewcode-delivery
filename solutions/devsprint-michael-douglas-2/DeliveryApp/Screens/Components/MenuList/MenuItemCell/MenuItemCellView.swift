//
//  MenuItemCellView.swift
//  DeliveryApp
//
//  Created by Hyago Henrique on 23/02/22.
//

import UIKit

struct MenuItemCellViewModel {
    let title: String
    let price: Double
    let icon: String
}

final class MenuItemCellView: UITableViewCell {
    
    private struct Configurations {
        static let iconImageSize: CGSize = .init(width: 64, height: 64)
        static let contentStackViewSpacing: CGFloat = 2
        static let titleLabelFontSize: CGFloat = 15
        static let priceLabelFontSize: CGFloat = 13
        static let cornerRadiusIcon: CGFloat = 14
        static let numberOfLines: Int = 2
    }
    
    // MARK: - View Properties
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Configurations.contentStackViewSpacing
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Configurations.titleLabelFontSize, weight: .bold)
        label.numberOfLines = Configurations.numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Configurations.priceLabelFontSize, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Configurations.cornerRadiusIcon
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Internal Methods
    
    func configure(with viewModel: MenuItemCellViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text =  viewModel.price.formatWithCurrency()
        iconImageView.image = UIImage(named: viewModel.icon)
    }
}

private extension MenuItemCellView {
    // MARK: - Constraints
    
    struct ConfigurationConstraints {
        static let topAnchorIconImage: CGFloat = 10
        static let bottomAnchorIconImage: CGFloat = -10
        static let trailingAnchorIconImage: CGFloat = -16
        
        static let trailingContentStackView: CGFloat = -20
        static let leadingContentStackView: CGFloat = 16
        static let topContentStackView: CGFloat = 10
        static let bottomContentStackView: CGFloat = -10
    }
    
    func setupViews() {
        backgroundColor = .white
        
        setupIconImageViewConstraints()
        setupContentStackViewConstraints()
    }
    
    func setupIconImageViewConstraints() {
        contentView.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: Configurations.iconImageSize.height),
            iconImageView.widthAnchor.constraint(equalToConstant: Configurations.iconImageSize.width),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConfigurationConstraints.trailingAnchorIconImage),
            iconImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: ConfigurationConstraints.topAnchorIconImage),
            iconImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: ConfigurationConstraints.bottomAnchorIconImage)
        ])
    }
    
    func setupContentStackViewConstraints() {
        contentView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConfigurationConstraints.leadingContentStackView),
            contentStackView.trailingAnchor.constraint(lessThanOrEqualTo: iconImageView.leadingAnchor, constant: ConfigurationConstraints.trailingContentStackView),
            contentStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: ConfigurationConstraints.topContentStackView),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: ConfigurationConstraints.bottomContentStackView),
        ])
    }
}
