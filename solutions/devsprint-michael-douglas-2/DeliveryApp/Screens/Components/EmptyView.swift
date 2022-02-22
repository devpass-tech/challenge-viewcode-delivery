//
//  EmptyView.swift
//  DeliveryApp
//
//  Created by Sara Batista dos Santos Felix (P) on 22/02/22.
//

import UIKit

final class EmptyView: UIView {
    private lazy var emptyLabel: UILabel = {
        let emptyTextLabel = UILabel()
        emptyTextLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyTextLabel.text = "Endereço não encontrado"
        emptyTextLabel.font = .boldSystemFont(ofSize: 10)
        emptyTextLabel.textAlignment = .center
        return emptyTextLabel
    }()
    
    private lazy var emptyText: UITextField = {
        let emptyTextField = UITextField()
        emptyTextField.translatesAutoresizingMaskIntoConstraints = false
        emptyTextField.placeholder = "Procure por ruas com número e bairro utilizando o campo de busca"
        emptyTextField.textAlignment = .center
        return emptyTextField
    }()
    
    init() {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        addSubview(emptyLabel)
        addSubview(emptyText)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            emptyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            emptyText.centerXAnchor.constraint(equalTo: emptyLabel.centerXAnchor),
            emptyText.centerYAnchor.constraint(equalTo: emptyLabel.centerYAnchor)
        ])
    }
}
