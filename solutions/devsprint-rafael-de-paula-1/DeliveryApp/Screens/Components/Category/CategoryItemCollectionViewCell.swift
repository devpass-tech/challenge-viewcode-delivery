//
//  CategoryItemCollectionViewCell.swift
//  DeliveryApp
//
//  Created by Rafael de Paula on 13/04/22.
//

import UIKit

final class CategoryItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Configuration
    
    private enum Configuration {
        static let imageSize: CGFloat = 54
        static let imageBorderRadius: CGFloat = 14
        static let labelTopMargin: CGFloat = 10
    }
    
    static let identifier = "CategoryItemCollectionViewCell"
    
    // MARK: - UI Components
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.clipsToBounds = true
        image.layer.cornerRadius = Configuration.imageBorderRadius
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(description: String, imageName: String) {
        descriptionLabel.text = description
        imageView.image = UIImage(named: imageName)
    }
}

// MARK: - Setup ViewCode

extension CategoryItemCollectionViewCell: ViewCode {
    
    func setupComponents() {
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        setupImageViewConstraints()
        setupDescriptionLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Configuration.imageSize),
            imageView.widthAnchor.constraint(equalToConstant: Configuration.imageSize)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Configuration.labelTopMargin),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
        ])
    }
}
