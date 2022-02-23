//
//  SampleComponentView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit

struct RestaurantCellViewConfiguration {
    let name: String
    let detail: String
    let icon: String
}

final class RestaurantCellView: UITableViewCell {
    
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
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = Configurations.iconImageSize.height / 2
        image.clipsToBounds = true
        return image
    }()
    
    func updateView(with configuration: RestaurantCellViewConfiguration) {
        nameLabel.text = configuration.name
        detailLabel.text = configuration.detail
        iconImageView.image = UIImage(named: configuration.icon)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setImageConstraints()
        setStackViewConstraints()
        setStyle()
     }

     required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
    
    private func addSubviews() {
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(detailLabel)
    }
}

extension RestaurantCellView {
    
    private struct Configurations {
        static let iconImageSize: CGSize = .init(width: 48, height: 48)
        static let contentStackViewSpacing: CGFloat = 5
    }
    
    func setImageConstraints() {
        contentView.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            iconImageView.heightAnchor.constraint(equalToConstant: Configurations.iconImageSize.height),
            iconImageView.widthAnchor.constraint(equalToConstant: Configurations.iconImageSize.width),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setStackViewConstraints() {
        
        contentView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            
            contentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            contentStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            contentStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            contentStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setStyle() {
        backgroundColor = .white
    }
}

