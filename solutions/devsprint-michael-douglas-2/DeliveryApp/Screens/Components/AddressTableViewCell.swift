//
//  AdressTableViewCell.swift
//  DeliveryApp
//
//  Created by Michelli Cristina de Paulo Lima on 22/02/22.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    static let identifier:String = "AdressTableViewCell"
    
    private lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var addressTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Rua Bela Cintra, 495"
        return label
    }()
    
    private lazy var addressSubtitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .lightGray
        label.text = "Consolação"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addComponents()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(addressTitle)
        self.stackView.addArrangedSubview(addressSubtitle)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
