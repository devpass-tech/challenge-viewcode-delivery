//
//  LoadingView.swift
//  DeliveryApp
//
//  Created by Vitor Conceicao on 19/07/22.
//

import UIKit

final class LoadingView: UIView {
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Buscando endereços..."
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        titleLabel.tintColor = .black
        return titleLabel
    }()
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        return loadingIndicator
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
}

extension LoadingView: ViewCode {
    func setupSubviews() {
        addSubview(titleLabel)
        addSubview(loadingIndicator)
    }
    
    func setupConstraints() {
        setupTitleLabelConstraints()
        setupLoadingIndicatorConstraints()
    }
    
    func setupExtraConfiguration() {
        loadingIndicator.startAnimating()
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupLoadingIndicatorConstraints() {
        NSLayoutConstraint.activate([
            loadingIndicator.topAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
