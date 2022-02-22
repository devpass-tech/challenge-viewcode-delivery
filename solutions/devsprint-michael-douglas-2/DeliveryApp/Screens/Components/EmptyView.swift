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
        emptyTitleTextLabel.font = .boldSystemFont(ofSize: 18)
        emptyTitleTextLabel.textAlignment = .center
        return emptyTitleTextLabel
    }()
    
    private lazy var emptySubtitleLabel: UILabel = {
        let emptySubtitleLabel = UILabel()
        emptySubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        emptySubtitleLabel.text = "Procure por ruas com número e bairro utilizando o campo de busca"
        emptySubtitleLabel.textColor = .gray
        emptySubtitleLabel.textAlignment = .center
        emptySubtitleLabel.numberOfLines = 0
        return emptySubtitleLabel
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        addSubview(emptyTitleLabel)
        emptyTitleLabel.addSubview(emptySubtitleLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            emptyTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emptyTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emptyTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            emptyTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120),
            
            emptySubtitleLabel.centerXAnchor.constraint(equalTo: emptyTitleLabel.centerXAnchor, constant: 100),
            emptySubtitleLabel.centerYAnchor.constraint(equalTo: emptyTitleLabel.centerYAnchor, constant: 60),
            emptySubtitleLabel.leadingAnchor.constraint(equalTo: emptyTitleLabel.leadingAnchor),
            emptySubtitleLabel.trailingAnchor.constraint(equalTo: emptyTitleLabel.trailingAnchor)
            
        ])
    }
}
