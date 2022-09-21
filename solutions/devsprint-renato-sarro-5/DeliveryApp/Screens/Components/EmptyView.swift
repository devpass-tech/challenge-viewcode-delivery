//
//  EmptyView.swift
//  DeliveryApp
//
//  Created by Dio on 19/09/22.
//

import UIKit

final class EmptyView: UIView {

    private lazy var labelTitle: UILabel = {
        let label = UILabel.build(style: .callout, alignment: .center)
        label.text = "Endereço não encontrado"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var labelSubtitle: UILabel = {
        let label = UILabel.build(style: .footnote, alignment: .center)
        label.text = "Procure por ruas com números e bairro utilizando o campo de busca"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

}

//MARK: - View code protocol

extension EmptyView: ViewCodeProtocol{

    func configViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

    func buildViews() {
        addSubviews([labelTitle, labelSubtitle])
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            labelTitle.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -7.5),
            labelTitle.centerXAnchor.constraint(equalTo: centerXAnchor),

            labelSubtitle.topAnchor.constraint(equalTo: centerYAnchor, constant: 7.5),
            labelSubtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelSubtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 53),
            labelSubtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -54)
        ])
    }
}
