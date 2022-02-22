//
//  SampleComponentView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit

struct RestaurantCellViewConfiguration {
    let restaurantName: String
    let restaurantType: String
    let restaurantImage: String
}

class RestaurantCellView: UIView {
    
    private lazy var restaurantName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var restaurantType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var restaurantImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        return image
    }()
    
        
    func updateView(with configuration: RestaurantCellViewConfiguration) {
        restaurantName.text = configuration.restaurantName
        restaurantType.text = configuration.restaurantType
        restaurantImage.image = UIImage(named: configuration.restaurantImage)
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
        addSubview(restaurantImage)
        addSubview(restaurantName)
        addSubview(restaurantType)
    }
}

extension RestaurantCellView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            restaurantImage.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            restaurantImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            restaurantImage.widthAnchor.constraint(equalToConstant: 48),
            restaurantImage.heightAnchor.constraint(equalToConstant: 48),
            
            restaurantName.topAnchor.constraint(equalTo: topAnchor, constant: 28),
            restaurantName.leftAnchor.constraint(equalTo: self.restaurantImage.rightAnchor, constant: 20),
            
            restaurantType.topAnchor.constraint(equalTo: self.restaurantName.bottomAnchor, constant: 5),
            restaurantType.leftAnchor.constraint(equalTo: self.restaurantImage.rightAnchor, constant: 20),
            
        ])
    }
    
    func setStyle() {
        backgroundColor = .white
    }
}

