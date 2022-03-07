//
//  RestaurantInfoView.swift
//  DeliveryApp
//
//  Created by pedro tres on 02/03/22.
//

import UIKit

struct RestaurantInfoViewConfiguration {
    let name: String
    let detail: String
    let icon: String
}

class RestaurantInfoView: UITableViewCell {
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Configurations.contentStackViewSpacing
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(detailLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = Configurations.iconImageSize.height / 2
        image.clipsToBounds = true
        return image
    }()
    
    func updateView(with configuration: RestaurantInfoViewConfiguration) {
        nameLabel.text = configuration.name
        detailLabel.text = configuration.detail
        iconImageView.image = UIImage(named: configuration.icon)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setStackViewConstraints()
        setImageConstraints()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(detailLabel)
        addSubview(iconImageView)
    }
}

extension RestaurantInfoView {
    
    private struct Configurations {
        static let iconImageSize: CGSize = .init(width: 48, height: 48)
        static let contentStackViewSpacing: CGFloat = 10
    }
    
    func setStyle() {
        backgroundColor = .white
    }
    
    func setStackViewConstraints() {
        
        contentView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            contentStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 21),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            contentStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            contentStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setImageConstraints() {
        contentView.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19),
            iconImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 21),
            iconImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
