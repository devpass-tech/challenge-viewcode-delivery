//
//  CategoryListView.swift
//  DeliveryApp
//
//  Created by Murillo R. Araújo on 28/02/22.
//

import UIKit

class CategoryListView: UIView {

    let scrollView = UIScrollView()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 20
        return stack
    }()

    public init() {
        super.init(frame: .zero)

        addSubviews()
        setConstraints()
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)

        for _ in 0..<10 {
            stackView.addArrangedSubview(CategoryCellView())
        }
    }

    private func setConstraints() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        scrollView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate ([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    func setStyle() {
        backgroundColor = .white
    }
}
