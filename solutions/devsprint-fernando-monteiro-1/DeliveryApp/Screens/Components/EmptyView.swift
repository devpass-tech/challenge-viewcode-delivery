//
//  EmptyView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class EmptyView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        return stackView
    }()
    
    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        self.setupViews()
        
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension EmptyView {

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
            stackView.widthAnchor.constraint(equalToConstant: 283),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}

#if DEBUG
import SwiftUI

struct EmptyView_Preview: PreviewProvider {
    static var previews: some View {
        let emptyView = EmptyView.stub()
        
        return emptyView.showPreview()
    }
}

extension EmptyView {
    
    static func stub() -> EmptyView {
        EmptyView(
            title: "Endereço não encontrado",
            subtitle: "Procure por ruas com número e bairro utilizando o campo de busca"
        )
    }
}
#endif
