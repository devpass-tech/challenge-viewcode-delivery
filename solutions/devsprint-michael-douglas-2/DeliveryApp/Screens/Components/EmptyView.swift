//
//  EmptyView.swift
//  DeliveryApp
//
//  Created by Sara Batista dos Santos Felix (P) on 22/02/22.
//

import UIKit

final class EmptyView: UIView {
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let emptyTitleLabel = UILabel()
        emptyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyTitleLabel.text = "Endereço não encontrado"
        emptyTitleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        emptyTitleLabel.textAlignment = .center
        return emptyTitleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let emptySubtitleLabel = UILabel()
        emptySubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        emptySubtitleLabel.text = "Procure por ruas com número e bairro utilizando o campo de busca"
        emptySubtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        emptySubtitleLabel.textColor = .gray
        emptySubtitleLabel.textAlignment = .center
        emptySubtitleLabel.numberOfLines = 0
        return emptySubtitleLabel
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
            backgroundColor = .white
            setupContentStackViewConstraints()
        }
        
        func setupContentStackViewConstraints() {
            addSubview(contentStackView)

            NSLayoutConstraint.activate([
                contentStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                contentStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                contentStackView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 16),
                contentStackView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -16)
            ])
    }
}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//struct EmptyViewPreviews: PreviewProvider {
//    static var previews: some View {
//        UIViewPreview {
//            let emptyView = EmptyView()
//            
//            return emptyView
//        }
//        .previewLayout(.fixed(width: 300, height: 300))
//    }
//}
//#endif
