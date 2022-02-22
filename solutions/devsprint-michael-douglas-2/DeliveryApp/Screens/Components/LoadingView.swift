//
//  LoadingView.swift
//  DeliveryApp
//
//  Created by Hyago Henrique on 21/02/22.
//

import UIKit

final class LoadingView: UIView {

    // MARK: - View Components

    private let loadingContainer: UIView = {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.isOpaque = true
        container.isHidden = false
        container.backgroundColor = .white
        return container
    }()

    lazy var loadingSpinner: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        indicator.isHidden = false
        indicator.hidesWhenStopped = true
        indicator.color = .black
        return indicator
    }()

    lazy var loadingMessage: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carregando..."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    // MARK: - Super Methods

    init() {
        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Internal Methods
    func setLoadingMessage(_ message: String?) {
        loadingMessage.text = message ?? "Carregando..."
    }
}

private extension LoadingView {

    func setupViews() {
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        addSubview(loadingContainer)
        loadingContainer.addSubview(loadingMessage)
        loadingContainer.addSubview(loadingSpinner)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.loadingContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.loadingContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            self.loadingContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.loadingContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor ),
            self.loadingMessage.centerYAnchor.constraint(equalTo: loadingContainer.centerYAnchor, constant: -50),
            self.loadingMessage.centerXAnchor.constraint(equalTo: loadingContainer.centerXAnchor),
            self.loadingSpinner.topAnchor.constraint(equalTo: loadingMessage.bottomAnchor, constant: 10),
            self.loadingSpinner.centerXAnchor.constraint(equalTo: loadingContainer.centerXAnchor),
        ])
    }
}
