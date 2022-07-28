//
//  RestaurantInfoView.swift
//  DeliveryApp
//
//  Created by Manoel Filho on 26/07/22.
//

import UIKit

final class RestaurantInfoView: UIView {
    
    var restaurant: Restaurant? {
        didSet{
            self.nameLabel.text = restaurant?.name
            self.categoryLabel.text = "\(restaurant?.category ?? "") \u{2022} \(restaurant?.deliveryTime.min ?? 0) - \(restaurant?.deliveryTime.max ?? 0) min"
            self.restaurantImage.image = UIImage(named: "restaurant-logo")
        }
    }
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Title"
        nameLabel.font = .systemFont(ofSize: 22, weight: .bold)
        nameLabel.tintColor = .black
        return nameLabel
    }()
    
    private lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.text = "Category"
        categoryLabel.font = .systemFont(ofSize: 15, weight: .regular)
        categoryLabel.tintColor = .black
        return categoryLabel
    }()
    
    private lazy var nameAndCategoryStackView: UIStackView = {
        let nameAndCategoryStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel])
        nameAndCategoryStackView.axis = .vertical
        nameAndCategoryStackView.spacing = 12
        return nameAndCategoryStackView
    }()
    
    private lazy var restaurantImage: UIImageView = {
        let restaurantImage = UIImageView()
        restaurantImage.clipsToBounds = true
        return restaurantImage
    }()
    
    private lazy var wrapperStackView: UIStackView = {
        let wrapperStackView = UIStackView(arrangedSubviews: [nameAndCategoryStackView, restaurantImage])
        wrapperStackView.translatesAutoresizingMaskIntoConstraints = false
        wrapperStackView.alignment = .firstBaseline
        return wrapperStackView
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
}

extension RestaurantInfoView: ViewCode {
    
    func setupSubviews() {
        addSubview(wrapperStackView)
    }
    
    func setupConstraints() {
        setupWrapperStackViewConstraints()
        setupRestaurantImageConstraints()
    }
    
    private func setupWrapperStackViewConstraints() {
        NSLayoutConstraint.activate([
            wrapperStackView.topAnchor.constraint(equalTo: topAnchor),
            wrapperStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            wrapperStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            wrapperStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupRestaurantImageConstraints() {
        let sizeImage = CGSize(width: 48, height: 48)
        NSLayoutConstraint.activate([
            restaurantImage.widthAnchor.constraint(equalToConstant: sizeImage.width),
            restaurantImage.heightAnchor.constraint(equalToConstant: sizeImage.height)
        ])
        restaurantImage.layer.cornerRadius = sizeImage.width / 2
    }
    
}
