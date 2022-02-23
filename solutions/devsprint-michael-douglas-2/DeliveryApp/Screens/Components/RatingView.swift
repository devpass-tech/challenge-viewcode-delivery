//
//  RatingView.swift
//  DeliveryApp
//
//  Created by Murillo R. Araújo on 23/02/22.
//

import UIKit

final class RatingView: UIView {

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.spacing = 16
        stack.alignment = .center
        return stack
    }()

    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "4.8 ★★★★★"
        label.textAlignment = .left
        return label
    }()

    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "351 avaliações"
        label.textAlignment = .right
        return label
    }()

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
        addSubview(stackView)
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(ratingLabel)
    }

    private func setConstraints() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate ([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    private func setStyle() {
        backgroundColor = .white
    }
}
