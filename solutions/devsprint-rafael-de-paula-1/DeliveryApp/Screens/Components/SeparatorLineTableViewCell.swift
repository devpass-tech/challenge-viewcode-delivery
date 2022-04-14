//
//  SeparatorLineTableViewCell.swift
//  DeliveryApp
//
//  Created by Rafael de Paula on 14/04/22.
//

import UIKit

final class SeparatorLineTableViewCell: UITableViewCell {

    // MARK: - Configuration
    
    enum Configuration {
        static let separatorHeight: CGFloat = 0.5
    }
    
    static let identifier = "SeparatorLineTableViewCell"
    
    // MARK: - UI Components
    
    private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SeparatorLineTableViewCell: ViewCode {
 
    func setupComponents() {
        contentView.addSubview(separatorView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: Configuration.separatorHeight)
        ])
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .white
    }
}
