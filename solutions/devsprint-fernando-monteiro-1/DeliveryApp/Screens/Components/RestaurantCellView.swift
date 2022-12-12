//
//  RestaurantCellView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class RestaurantCellView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupCell(restaurant: Restaurant.stub())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var restaurantImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "restaurant-logo")
        image.clipsToBounds = true
        image.layer.cornerRadius = 24
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var deliveryTimeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, deliveryTimeLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, subtitleStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    func setupCell(restaurant: Restaurant) {
        let name = restaurant.name
        let category = restaurant.category + " • "
        let deliveryTime = String(restaurant.deliveryTime.min) + "-" + String(restaurant.deliveryTime.max) + " min"

        nameLabel.text = name
        categoryLabel.text = category
        deliveryTimeLabel.text = deliveryTime

    }
    
}

private extension RestaurantCellView {
    func setupViews() {
        self.backgroundColor = .white
        
        configureSubviews()
        configureSubviewsConstraints()

    }

    func configureSubviews() {
        self.addSubview(containerView)
        containerView.addSubview(restaurantImage)
        containerView.addSubview(stackView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            restaurantImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            restaurantImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            restaurantImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8),
            restaurantImage.widthAnchor.constraint(equalToConstant: 48),
            restaurantImage.heightAnchor.constraint(equalToConstant: 48),
            
            stackView.centerYAnchor.constraint(equalTo: restaurantImage.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: restaurantImage.trailingAnchor, constant: 12),
            
        ])
    }
}

#if DEBUG
import SwiftUI

struct RestaurantCellView_Preview: PreviewProvider {
    static var previews: some View {
        return RestaurantCellView().showPreview()
    }
}
#endif
