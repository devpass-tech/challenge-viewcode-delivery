//
//  AddressView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

protocol AddressViewDelegate: AnyObject {
    func pushAddresSearchView()
}

class AddressView: UIView {
    
    weak var delegate: AddressViewDelegate?
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R. Guiratinga, 500"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        let attributeBtn = NSMutableAttributedString(string: "Editar", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemBlue, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold)])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.setAttributedTitle(attributeBtn, for: .normal)
        button.addTarget(self, action: #selector(didTapEditButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addressLabel, editButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        return stackView
    }()
    
    @objc func didTapEditButton () {
        delegate?.pushAddresSearchView()
    }
    
}

private extension AddressView {
    
    func setupViews() {
        self.backgroundColor = .white
        
        self.configureSubviews()
        self.configureSubviewsConstraints()

    }
    
    func configureSubviews() {
        self.addSubview(stackView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 66),
            
            editButton.heightAnchor.constraint(equalToConstant: 32),
            editButton.widthAnchor.constraint(equalToConstant: 60),
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17)
        ])
    }
}

#if DEBUG
import SwiftUI

struct Address_Preview: PreviewProvider {
    static var previews: some View {
        let addressView = AddressView()
        
        return addressView.showPreview()
    }
}
#endif
