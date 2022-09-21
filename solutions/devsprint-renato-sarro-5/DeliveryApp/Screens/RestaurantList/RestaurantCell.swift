//
//  RestaurantCell.swift
//  DeliveryApp
//
//  Created by Cleber Reis on 20/09/22.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "restaurant-logo")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 24
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Benjamin a Padaria"
        label.font = UIFont(name: "SFProText-Semibold", size: 15)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var titleDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Italiana • 38-48 min"
        label.font = UIFont(name: "SFProText-Regular", size: 13)
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension RestaurantCell: ViewCodeProtocol {
    
    func configViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func buildViews() {
        addSubviews([icon, titleLabel, titleDescription])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: icon.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            titleDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            titleDescription.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleDescription.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            titleDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            
        ])
    }
}
