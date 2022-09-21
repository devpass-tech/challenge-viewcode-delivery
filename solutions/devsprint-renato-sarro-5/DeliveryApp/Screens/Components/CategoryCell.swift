//
//  CategoryCell.swift
//  DeliveryApp
//
//  Created by Diogenes Pereira on 20/09/22.
//

import UIKit

final class CategoryCell: UIView {

    private lazy var imageCatergory: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 14
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    private lazy var labelCategory: UILabel = {
        let label = UILabel.build(style: .captionOne)
        label.text = "Mercado"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageCatergory, labelCategory])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()

    func changeCategoryName(_ name:  String) {
        labelCategory.text = name
    }

    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

}

//MARK: - View code protocol

extension CategoryCell: ViewCodeProtocol {

    func configViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

    func buildViews() {
        addSubviews([stackView])
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),

            imageCatergory.heightAnchor.constraint(equalToConstant: 54),
            imageCatergory.widthAnchor.constraint(equalToConstant: 54)
        ])
    }
}

