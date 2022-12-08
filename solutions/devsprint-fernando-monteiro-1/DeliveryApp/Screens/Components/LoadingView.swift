//
//  LoadingView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class LoadingView: UIView {

    // MARK: - Properties
    
    var title: String = "Buscando endereços..."
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Code
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)

        return label
    }()
    
    private lazy var loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
            
        return indicator
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, loadingActivityIndicator])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center

        return stackView
    }()

}

private extension LoadingView {
    
    func setupViews() {
        self.backgroundColor = .white
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        self.addSubview(stackView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
                    stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                    stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                ])
    }
}


#if DEBUG
import SwiftUI

struct LoadingView_Preview: PreviewProvider {
    static var previews: some View {
        return LoadingView().showPreview()
    }
}
#endif
