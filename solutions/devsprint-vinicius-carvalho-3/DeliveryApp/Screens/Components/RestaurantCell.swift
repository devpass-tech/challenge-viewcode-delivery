//
//  RestaurantCell.swift
//  DeliveryApp
//
//  Created by Luciano Berchon on 20/07/22.
//

import Foundation
import UIKit

class RestaurantCell: UITableViewCell {
    private struct Configurations {
        static let imageSize: CGSize = .init(width: 56, height: 56)
        static let stackViewSpacing: CGFloat = 8
    }
    
    private lazy var stackViewCell: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Configurations.stackViewSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(stackViewText)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackViewText: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Configurations.stackViewSpacing / 2
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        return stackView
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = Configurations.imageSize.width / 2
        image.clipsToBounds = true
        return image
    }()
    
    private  lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private  lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateCell(with cellData: Restaurant) {
        title.text = cellData.name
        subtitle.text = "\(cellData.category) \u{2022} \(cellData.deliveryTime.min)-\(cellData.deliveryTime.max) min"
        image.image = UIImage(named: cellData.imageName)
    }
}

extension RestaurantCell: ViewCode {
    func setupSubviews() {
        contentView.addSubview(stackViewCell)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Configurations.stackViewSpacing),
            stackViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Configurations.stackViewSpacing),
            stackViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Configurations.stackViewSpacing),
            stackViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Configurations.stackViewSpacing),
            
            image.heightAnchor.constraint(equalToConstant: Configurations.imageSize.height),
            image.widthAnchor.constraint(equalToConstant: Configurations.imageSize.width),
        ])
    }
    
    func setupExtraConfiguration() {
        self.accessoryType = .disclosureIndicator
    }
}
