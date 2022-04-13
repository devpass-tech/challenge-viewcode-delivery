//
//  EmptyVIew.swift
//  DeliveryApp
//
//  Created by Thyago Raphael on 12/04/22.
//

import UIKit

class EmptyView: UIView {

    private enum DefaultTexts {
        static let titleLabel = "Endereço não encontrado"
        static let subTitleLabel = "Procure por ruas com número e bairro \n utilizando o campo de busca"
    }
    
    // MARK: UI Components
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = DefaultTexts.titleLabel
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = DefaultTexts.subTitleLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: Extensions

extension EmptyView: ViewCode {
    func setupComponents() {
        self.addSubview(stackView)
    }
    
    func setupConstraints() {        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
