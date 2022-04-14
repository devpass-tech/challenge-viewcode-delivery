//
//  EmptyVIew.swift
//  DeliveryApp
//
//  Created by Thyago Raphael on 12/04/22.
//

import UIKit

final class EmptyView: UIView {

    private enum DefaultTexts {
        static let titleLabel = "Endereço não encontrado"
        static let subTitleLabel = "Procure por ruas com número e bairro utilizando o campo de busca"
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
        label.numberOfLines = 0
        
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
        stackView.addSubview(subtitleLabel)
    }
    
    func setupConstraints() {        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 54),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -54),
        ])
    }
}

#if DEBUG
import SwiftUI

struct EmptyView_Preview: PreviewProvider {
    static var previews: some View {
        EmptyView().showPreview()
    }
}
#endif
