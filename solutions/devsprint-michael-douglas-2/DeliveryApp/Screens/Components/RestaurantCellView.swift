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

class RestaurantCellView: UIView {
    
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
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        return image
    }()
    
    func updateView(with configuration: RestaurantCellViewConfiguration) {
        nameLabel.text = configuration.name
        detailLabel.text = configuration.detail
        iconImageView.image = UIImage(named: configuration.icon)
    }
    
    public init() {
        super.init(frame: .zero)

        addSubviews()
        setConstraints()
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
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 28),
            nameLabel.leftAnchor.constraint(equalTo: self.iconImageView.rightAnchor, constant: 20),
            
            detailLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            detailLabel.leftAnchor.constraint(equalTo: self.iconImageView.rightAnchor, constant: 20),
            
        ])
    }
    
    func setStyle() {
        backgroundColor = .white
    }
}

