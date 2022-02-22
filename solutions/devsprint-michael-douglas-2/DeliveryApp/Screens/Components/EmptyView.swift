//
//  EmptyView.swift
//  DeliveryApp
//
//  Created by Sara Batista dos Santos Felix (P) on 22/02/22.
//

import UIKit

final class EmptyView: UIView {
    private lazy var emptyTitleLabel: UILabel = {
        let emptyTitleTextLabel = UILabel()
        emptyTitleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyTitleTextLabel.text = "Endereço não encontrado"
        emptyTitleTextLabel.font = .boldSystemFont(ofSize: 10)
        emptyTitleTextLabel.textAlignment = .center
        return emptyTitleTextLabel
    }()
    
    private lazy var emptySubtitleTextField: UITextField = {
        let emptySubtitleTextField = UITextField()
        emptySubtitleTextField.translatesAutoresizingMaskIntoConstraints = false
        emptySubtitleTextField.placeholder = "Procure por ruas com número e bairro utilizando o campo de busca"
        emptySubtitleTextField.textAlignment = .center
        return emptySubtitleTextField
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
        addSubview(emptyTitleLabel)
        addSubview(emptySubtitleTextField)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            emptyTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emptyTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            emptySubtitleTextField.centerXAnchor.constraint(equalTo: emptyTitleLabel.centerXAnchor),
            emptySubtitleTextField.centerYAnchor.constraint(equalTo: emptyTitleLabel.centerYAnchor)
        ])
    }
}
