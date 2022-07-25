//
//  EmptyView.swift
//  DeliveryApp
//
//  Created by Raline Maria da Silva on 20/07/22.
//

import UIKit

class EmptyView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Endereço não encontrado"
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return titleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Procure por ruas com número e bairro utilizando o campo de busca"
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        subtitleLabel.textColor = UIColor(red: 0.322, green: 0.322, blue: 0.322, alpha: 1)
        
        return subtitleLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView (arrangedSubviews: [titleLabel, subtitleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupSubviews()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EmptyView: ViewCode {
    func setupSubviews() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        let constraint = [
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 52),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -52)
            
        ]
        constraint.forEach {(item) in
            item.isActive = true
        }
    }
    
    func setupExtraConfiguration() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
