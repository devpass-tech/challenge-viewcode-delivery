//
//  LoadingView.swift
//  DeliveryApp
//
//  Created by Cora on 19/09/22.
//

import UIKit

final class LoadingView: UIView, ViewCodeProtocol {
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel.build(style: .callout, alignment: .center)
        label.text = "Buscando endereços..."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        return indicatorView
    }()
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: View code protocol
    func configViews() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func buildViews() {
        addSubviews([labelTitle, loadingView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            labelTitle.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -7),
            labelTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loadingView.topAnchor.constraint(equalTo: centerYAnchor, constant: 7),
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
