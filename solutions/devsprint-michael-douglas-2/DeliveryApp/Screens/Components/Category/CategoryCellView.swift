//
//  CategoryCellView.swift
//  DeliveryApp
//
//  Created by Murillo R. Araújo on 21/02/22.
//

import UIKit

final class CategoryCellView: UICollectionViewCell {

    static let identifier = "CategoryCell"

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pizza"
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        setStyle()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }

    private func setConstraints() {
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate ([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.widthAnchor.constraint(equalToConstant: 54),
            imageView.heightAnchor.constraint(equalToConstant: 54),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setStyle() {
        backgroundColor = .white
    }
}
