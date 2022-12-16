//
//  CategoryCellView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class CategoryCellView: UICollectionViewCell {
    
    static let identifier = "CategoryCellView"
    
    private let stackview:UIStackView = {
        let view = UIStackView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 10
        return view
    }()
    
    private let image:UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    private let label:UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        label.isOpaque = true
        return label
    }()
    
    
    func setupView(_ category:Category){
        self.image.image = UIImage(named:category.imageName )
        self.label.text = category.name
     
        self.configureSubviews()
        
        self.configureSubviewsConstraints()
        
    }
    
    private func configureSubviews() {
        self.contentView.addSubview(stackview)
        
        self.stackview.addArrangedSubview(image)
        self.stackview.addArrangedSubview(label)
    }

    private func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            stackview.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackview.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 54),
            image.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    
}


#if DEBUG
import SwiftUI

struct CategoryCellView_Preview: PreviewProvider {
    static var previews: some View {
        let emptyView = CategoryCellView()
        emptyView.setupView(.stub())
        
        return emptyView.showPreview()
    }
}

#endif
