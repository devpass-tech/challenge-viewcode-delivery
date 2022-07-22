//
//  MenuItemCell.swift
//  DeliveryApp
//
//  Created by Manoel Filho on 21/07/22.
//

import UIKit

final class MenuItemCell: UIView {
    
    var menuItem: MenuItem? {
        didSet{
            self.nameLabel.text = menuItem?.name
            self.priceLabel.text = .currencyValue(value: menuItem?.price ?? 0)
            self.productImage.image = UIImage(named: "pizza")
        }
    }
    
    private lazy var wrapperItemStackView: UIStackView = {
        let wrapperItemStackView = UIStackView()
        wrapperItemStackView.alignment = .center
        wrapperItemStackView.translatesAutoresizingMaskIntoConstraints = false
        return wrapperItemStackView
    }()
    
    private lazy var descriptionItemStackView: UIStackView = {
        let descriptionItemStackView = UIStackView()
        descriptionItemStackView.axis = .vertical
        descriptionItemStackView.spacing = 5
        descriptionItemStackView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionItemStackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Title"
        nameLabel.font = .systemFont(ofSize: 15, weight: .medium)
        nameLabel.tintColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "0"
        priceLabel.font = .systemFont(ofSize: 13, weight: .regular)
        priceLabel.tintColor = .gray
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    private lazy var productImage: UIImageView = {
        let productImage = UIImageView()
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.clipsToBounds = true
        productImage.contentMode = .scaleAspectFill
        productImage.layer.cornerRadius = 10
        return productImage
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
}


extension MenuItemCell: ViewCode {
    
    func setupSubviews() {
        
        descriptionItemStackView.addArrangedSubview(nameLabel)
        descriptionItemStackView.addArrangedSubview(priceLabel)
        
        wrapperItemStackView.addArrangedSubview(descriptionItemStackView)
        wrapperItemStackView.addArrangedSubview(productImage)
        
        addSubview(wrapperItemStackView)
    }
    
    func setupConstraints() {
        setupStacksConstraints()
        setupImagesConstraints()
    }
    
    private func setupImagesConstraints() {
        let sizeImage = CGSize(width: 65, height: 65)
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalToConstant: sizeImage.width),
            productImage.heightAnchor.constraint(equalToConstant: sizeImage.height)
        ])
    }
    
    private func setupStacksConstraints() {
        NSLayoutConstraint.activate([
            wrapperItemStackView.topAnchor.constraint(equalTo: topAnchor),
            wrapperItemStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            wrapperItemStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            wrapperItemStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
